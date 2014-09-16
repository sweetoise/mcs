class AddPinAccessToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pin_access, :boolean, :default => true
  end
end
