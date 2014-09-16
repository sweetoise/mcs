class CreateStateOfOrigins < ActiveRecord::Migration
  def change
    create_table :state_of_origins do |t|
      t.string :name

      t.timestamps
    end
  end
end
