class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :number
      t.string :serial

      t.timestamps
    end
  end
end
