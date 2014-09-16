class FirstSemesterCourseOutline < ActiveRecord::Base
  attr_accessible :book_url, :content, :first_semester_course_id, :topic, :video_url
  
  belongs_to :first_semester_course
end
