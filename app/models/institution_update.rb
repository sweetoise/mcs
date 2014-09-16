class InstitutionUpdate < ActiveRecord::Base
  attr_accessible :content, :institution_id, :title
  
  
  belongs_to :institution
end
