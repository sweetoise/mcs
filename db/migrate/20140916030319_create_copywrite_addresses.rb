class CreateCopywriteAddresses < ActiveRecord::Migration
  def change
    create_table :copywrite_addresses do |t|
      t.string :address
      t.text :description

      t.timestamps
    end
  end
end
