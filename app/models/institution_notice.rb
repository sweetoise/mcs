class InstitutionNotice < ActiveRecord::Base
  attr_accessible :content, :date, :institution_id, :signed_by, :title
  
  belongs_to :institution
end
