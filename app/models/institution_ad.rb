class InstitutionAd < ActiveRecord::Base
  attr_accessible :content, :institution_id, :name, :email, :address, :website, :price
  
  
  belongs_to :institution
end
