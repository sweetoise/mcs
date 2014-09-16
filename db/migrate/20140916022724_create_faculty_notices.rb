class CreateFacultyNotices < ActiveRecord::Migration
  def change
    create_table :faculty_notices do |t|
      t.string :title
      t.text :content
      t.text :signed_by
      t.datetime :date
      t.integer :faculty_id

      t.timestamps
    end
  end
end
