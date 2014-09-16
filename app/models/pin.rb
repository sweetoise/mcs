class Pin < ActiveRecord::Base
  attr_accessible :number, :serial
  
  validates_length_of :number, :in => (16..16)
  validates_numericality_of :number, :only_integer => true
end
