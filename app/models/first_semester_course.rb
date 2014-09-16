class FirstSemesterCourse < ActiveRecord::Base
  attr_accessible :code, :course_type_id, :credit_load, :description, :level_id, :semester_id, :title, :content

  belongs_to :level
  belongs_to :semester
  belongs_to :course_type
  has_many :users
  has_many :first_semester_library_book_outlines, :through => :first_semester_library_books
  has_many :first_semester_library_books
  has_many :first_semester_past_questions
  has_many :first_semester_course_outlines
end
