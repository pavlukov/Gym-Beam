class CreateJoinTableSportSectionUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :sport_sections, :users do |t|
      t.index [:sport_section_id, :user_id]
    end
  end
end
