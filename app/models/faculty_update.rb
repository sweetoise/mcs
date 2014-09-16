class FacultyUpdate < ActiveRecord::Base
  attr_accessible :content, :date, :faculty_id, :signed_by, :title
  
  belongs_to :faculty
end
