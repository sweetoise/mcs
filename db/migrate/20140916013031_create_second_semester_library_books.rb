class CreateSecondSemesterLibraryBooks < ActiveRecord::Migration
  def change
    create_table :second_semester_library_books do |t|
      t.text :author
      t.string :name
      t.integer :second_semester_course_id
      t.text :description
      t.integer :book_pages

      t.timestamps
    end
  end
end
