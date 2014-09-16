class Faculty < ActiveRecord::Base
  attr_accessible :institution_id, :name
  
  belongs_to :institution
  has_many :departments, dependent: :destroy
  has_many :faculty_ads
  has_many :levels, :through => :departments
  has_many :faculty_notices, dependent: :destroy
  has_many :faculty_updates, dependent: :destroy
  has_many :faculty_levels
end
