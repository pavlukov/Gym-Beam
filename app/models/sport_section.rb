# == Schema Information
#
# Table name: sport_sections
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  coach_name  :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  address     :string
#  searching   :boolean          default(FALSE)
#

require 'elasticsearch/model'

class SportSection < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  acts_as_taggable
  acts_as_commentable

  paginates_per 10

  has_and_belongs_to_many :users
  has_and_belongs_to_many :tickets

  validates :name, presence: true
  validates :coach_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :address, presence: true

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :name, analyzer: 'english'
      indexes :coach_name, analyzer: 'english'
      indexes :description, analyzer: 'english'
    end
  end
end

