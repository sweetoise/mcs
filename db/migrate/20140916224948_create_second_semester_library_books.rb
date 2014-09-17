class CreateSecondSemesterLibraryBooks < ActiveRecord::Migration
  def change
    create_table :second_semester_library_books do |t|
      t.string :name
      t.text :author
      t.integer :book_pages
      t.text :description
      t.integer :second_semester_course_id

      t.timestamps
    end
  end
end
