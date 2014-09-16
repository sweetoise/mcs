class SecondSemesterCourseOutline < ActiveRecord::Base
  attr_accessible :book_url, :content, :second_semester_course_id, :topic, :video_url
  
  
  belongs_to :second_semester_course
end
