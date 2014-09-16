class AddNationalityIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nationality_id, :integer, :defautl => nil
  end
end
