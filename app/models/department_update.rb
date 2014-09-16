class DepartmentUpdate < ActiveRecord::Base
  attr_accessible :content, :date, :department_id, :signed_by, :title
  
  belongs_to :department
end
