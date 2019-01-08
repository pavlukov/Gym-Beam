# == Schema Information
#
# Table name: comments
#
#  id               :bigint(8)        not null, primary key
#  commentable_id   :integer
#  commentable_type :string
#  title            :string
#  body             :text
#  subject          :string
#  user_id          :integer          not null
#  parent_id        :integer
#  lft              :integer
#  rgt              :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ActiveRecord::Base
  acts_as_nested_set :scope => [:commentable_id, :commentable_type]

  validates :body, :presence => true
  validates :user, :presence => true

  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  def self.build_from(obj, user_id, comment)
    new \
      :commentable => obj,
      :body        => comment,
      :user_id     => user_id
  end
end
