class AddIdToTicketsUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets_users, :id, :primary_key
  end
end
