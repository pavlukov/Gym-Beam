# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers:[:facebook]
  has_and_belongs_to_many :tickets
  has_and_belongs_to_many :sport_sections

  enum role: [:user, :owner, :admin]
  after_initialize :set_default_role, if: :new_record?
  before_create :set_approved_status, if: :new_record?

  def set_default_role
    self.role ||= :user
  end

  def set_approved_status
    if self.owner?
      self.approved = false
    else
      self.approved = true
    end
  end

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : :not_approved
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      binding.pry
    end
  end
end
