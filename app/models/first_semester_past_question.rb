class FirstSemesterPastQuestion < ActiveRecord::Base
  attr_accessible :first_semester_course_id, :year, :solution_url
  
  belongs_to :first_semester_course
  belongs_to :level
end
