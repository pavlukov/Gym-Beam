class AddIdToSportSectionsUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :sport_sections_users, :id, :primary_key
  end
end
