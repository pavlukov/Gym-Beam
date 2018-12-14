class CreateJoinTableSportSectionsTickets < ActiveRecord::Migration[5.2]
  def change
    create_join_table :sport_sections, :tickets do |t|
      t.index [:sport_section_id, :ticket_id]
    end
  end
end
