class CreateFacultyUpdates < ActiveRecord::Migration
  def change
    create_table :faculty_updates do |t|
      t.string :title
      t.text :content
      t.datetime :date
      t.string :signed_by
      t.integer :faculty_id

      t.timestamps
    end
  end
end
