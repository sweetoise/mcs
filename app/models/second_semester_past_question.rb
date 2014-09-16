class SecondSemesterPastQuestion < ActiveRecord::Base
  attr_accessible  :second_semester_course_id, :solution_url, :year

  belongs_to :second_semester_course
  belongs_to :level
end
