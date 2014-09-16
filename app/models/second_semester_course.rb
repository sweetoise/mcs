class SecondSemesterCourse < ActiveRecord::Base
  attr_accessible :code, :content, :course_type_id, :credit_load, :description, :level_id, :semester_id, :title



  belongs_to :level
  belongs_to :semester
  belongs_to :course_type
  has_many :users
  has_many :second_semester_library_books
  has_many :second_semester_library_book_outlines, :through => :second_semester_library_books
  has_many :second_semester_past_questions
  has_many :second_semester_course_outlines
end
