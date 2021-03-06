class FirstSemesterLibraryBook < ActiveRecord::Base
  attr_accessible :author, :book_pages, :description, :first_semester_course_id, :name, :image

  # has_attached_file :image,
   #                  :storage => :dropbox,
    #                 :dropbox_credentials => "#{Rails.root}/config/dropbox_config.yml",
     #                :styles => { :medium => "300x300>", :thumb => "80x100>", :small => "40x50>" },
      #               :dropbox_options => {
       #                                 :path => proc { |style| "#{style}/#{id}_#{image.original_filename}" }
        #                                }

  #validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "80x100>", :small => "40x50>" }, :default_url => ""
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :first_semester_course
  belongs_to :level
  has_many :first_semester_library_book_outlines
end
