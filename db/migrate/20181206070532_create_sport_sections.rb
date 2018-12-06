class CreateSportSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sport_sections do |t|
      t.string :name
      t.string :coach_name
      t.string :description

      t.timestamps
    end
  end
end
