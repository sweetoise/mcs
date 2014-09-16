class AddAttachmentImageToFirstSemesterLibraryBooks < ActiveRecord::Migration
  def self.up
    change_table :first_semester_library_books do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :first_semester_library_books, :image
  end
end
