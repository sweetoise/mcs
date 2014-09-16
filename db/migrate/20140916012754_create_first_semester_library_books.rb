class CreateFirstSemesterLibraryBooks < ActiveRecord::Migration
  def change
    create_table :first_semester_library_books do |t|
      t.string :name
      t.integer :first_semester_course_id
      t.text :description
      t.integer :book_pages
      t.text :author

      t.timestamps
    end
  end
end
