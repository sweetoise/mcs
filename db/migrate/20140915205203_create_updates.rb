class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.text :description
      t.integer :event_id

      t.timestamps
    end
  end
end
