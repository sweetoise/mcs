class Level < ActiveRecord::Base
  attr_accessible :department_id, :faculty_id, :institution_id, :level
  
  belongs_to :department
  belongs_to :faculty
  belongs_to :institution
  has_many :first_semester_courses, dependent: :destroy
  has_many :first_semester_past_questions, :through => :first_semester_courses
  has_many :first_semester_library_books, :through => :first_semester_courses
  has_many :second_semester_courses, dependent: :destroy
  has_many :second_semester_library_books, :through => :second_semester_courses
  has_many :second_semester_past_questions, :through => :second_semester_courses
  
end
