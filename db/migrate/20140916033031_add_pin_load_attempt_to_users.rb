class AddPinLoadAttemptToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pin_load_attempt, :integer, :default => 0
  end
end
