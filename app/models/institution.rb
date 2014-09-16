class Institution < ActiveRecord::Base
  attr_accessible :name

  has_many :users
  has_many :faculties, dependent: :destroy
  has_many :departments, :through => :faculties
  has_many :levels, :through => :faculties
  has_many :institution_ads, dependent: :destroy
  has_many :institution_notices, dependent: :destroy
  has_many :institution_updates, dependent: :destroy
end
