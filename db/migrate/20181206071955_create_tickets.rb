class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.date :expire_date
      t.integer :visits_remaining
      t.float :cost

      t.timestamps
    end
  end
end
