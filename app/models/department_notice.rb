class DepartmentNotice < ActiveRecord::Base
  attr_accessible :content, :date, :department_id, :signed_by, :title
end
