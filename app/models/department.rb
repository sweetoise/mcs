class Department < ActiveRecord::Base
  attr_accessible :faculty_id, :institution_id, :name
  
  belongs_to :faculty
  belongs_to :institution
  has_many :levels, dependent: :destroy
  has_many :department_notices, dependent: :destroy
  has_many :department_updates, dependent: :destroy
end
