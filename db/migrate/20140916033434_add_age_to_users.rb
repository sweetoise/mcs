class AddAgeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :date, :default => nil
    add_column :users, :first_name, :string, :default => nil
    add_column :users, :last_name, :string, :default => nil
    add_column :users, :alternative_email, :string, :default => nil
    add_column :users, :title_id, :integer, :default => nil
    add_column :users, :state_of_origin_id, :integer, :default => nil
    add_column :users, :address, :text, :default => nil
  end
end
