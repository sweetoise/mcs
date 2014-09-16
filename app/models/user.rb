class User < ActiveRecord::Base

  after_save :set_default_role

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :role_ids, :pin_access, :as => :superadmin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me,
                  :institution_id, :faculty_id, :faculty_level_id, :department_id, :level_id, :gender_id, :title_id, :state_of_origin_id, :first_semester_course_id, :second_semester_course_id, :photo, :age, :first_name, :last_name, :address, :nationality, :alternative_email, :nationality_id

  validates_presence_of :name, :on=>:create
  validates_uniqueness_of :name, :allow_blank => true, :if => :name_changed?, :case_sensitive => false

  validates_presence_of :email, :on=>:create
  validates_uniqueness_of    :email,:case_sensitive => false, :allow_blank => true, :if => :email_changed?
  validates_format_of :email, :with  => Devise.email_regexp, :allow_blank => true, :if => :email_changed?
  validates_presence_of   :password, :on=>:create
  validates_confirmation_of   :password, :on=>:create
  validates_length_of :password, :within => Devise.password_length, :allow_blank => true

  has_attached_file :photo,
                    :storage => :dropbox,
                    :dropbox_credentials => "#{Rails.root}/config/dropbox_config.yml",
                    :styles => { :medium => "300x300>", :pix => "180x150>", :thumb => "80x100>", :small => "30x35>" },
                    :dropbox_options => {
                                    :path => proc { |style| "#{style}/#{id}_#{photo.original_filename}" }
                                  }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  #has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "80x100>", :pix => "180x150>", :small => "30x35>" }, :default_url => ""
  #validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  # Setup accessible (or protected) attributes for your model

  belongs_to :institution
  belongs_to :faculty
  belongs_to :faculty_level
  belongs_to :department
  belongs_to :level
  belongs_to :first_semester_course
  belongs_to :second_semester_course
  belongs_to :gender
  belongs_to :title
  belongs_to :state_of_origin
  belongs_to :nationality

  private
  def set_default_role
    if
    self.role_ids.empty?
      self.role_ids = [3]
    end
  end

  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

  def email_required?
    true
  end

end
