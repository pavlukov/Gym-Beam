class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :sport_sections, :adress, :address
  end
end
