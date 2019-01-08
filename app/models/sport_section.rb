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
#  adress      :string
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

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :name, analyzer: 'english'
      indexes :coach_name, analyzer: 'english'
      indexes :description, analyzer: 'english'
    end
  end
end

