class AddIdToSportSectionsTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :sport_sections_tickets, :id, :primary_key
  end
end
