class AddExpirationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :expiration, :timestamp
  end
end
