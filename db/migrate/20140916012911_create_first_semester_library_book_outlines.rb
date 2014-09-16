class CreateFirstSemesterLibraryBookOutlines < ActiveRecord::Migration
  def change
    create_table :first_semester_library_book_outlines do |t|
      t.string :topic
      t.text :content
      t.string :book_url
      t.integer :first_semester_library_book_id

      t.timestamps
    end
  end
end
