class SecondSemesterLibraryBookOutline < ActiveRecord::Base
  attr_accessible :content, :second_semester_library_book_id, :topic, :book_url
  
  belongs_to :second_semester_library_book
  belongs_to :second_semester_course
end
