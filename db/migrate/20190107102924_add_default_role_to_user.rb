class AddDefaultRoleToUser < ActiveRecord::Migration[5.2]
  def self.up
    change_table :users do |t|
      t.change :role, :integer, default: 0
    end
  end
  def self.down
    change_table :users do |t|
      t.change :role, :integer
    end
  end
end
