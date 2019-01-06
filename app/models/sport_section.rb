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
  paginates_per 5
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tickets
end

