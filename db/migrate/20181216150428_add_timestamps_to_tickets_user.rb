class AddTimestampsToTicketsUser < ActiveRecord::Migration[5.2]
  def change
    change_table(:tickets_users) do |t|
      t.timestamps
    end
  end
end
