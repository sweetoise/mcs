class FirstSemesterLibraryBookOutline < ActiveRecord::Base
  attr_accessible :book_url, :content, :first_semester_library_book_id, :topic
  
  belongs_to :first_semester_library_book
  belongs_to :first_semester_course
end
