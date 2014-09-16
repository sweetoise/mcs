class AddAttachmentImageToSecondSemesterLibraryBooks < ActiveRecord::Migration
  def self.up
    change_table :second_semester_library_books do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :second_semester_library_books, :image
  end
end
