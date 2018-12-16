class AddAdressToSportSections < ActiveRecord::Migration[5.2]
  def change
    add_column :sport_sections, :adress, :string
  end
end
