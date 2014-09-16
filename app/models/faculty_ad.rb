class FacultyAd < ActiveRecord::Base
  attr_accessible :address, :content, :email, :faculty_id, :name, :price, :website
  
  belongs_to :faculty
  has_many :faculty_levels
end
