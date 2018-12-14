class CreateJoinTableTicketUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :tickets, :users do |t|
      t.index [:ticket_id, :user_id]
    end
  end
end
