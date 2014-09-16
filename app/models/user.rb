class User < ActiveRecord::Base

  after_save :set_default_role

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :photo,
                    :storage => :dropbox,
                    :dropbox_credentials => "#{Rails.root}/config/dropbox_config.yml",
                    :styles => { :medium => "300x300>", :pix => "180x150>", :thumb => "80x100>", :small => "30x35>" },
                    :dropbox_options => {
                                    :path => proc { |style| "#{style}/#{id}_#{photo.original_filename}" }
                                  }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "80x100>", :pix => "180x150>", :small => "30x35>" }, :default_url => ""
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  # Setup accessible (or protected) attributes for your model

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :photo
  # attr_accessible :title, :body

  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false

  private
  def set_default_role
    if
    self.role_ids.empty?
      self.role_ids = [3]
    end
  end

end
