class Tenant
  include DataMapper::Resource
  include DataMapper::Validate
  attr_accessor :password, :password_confirmation

  has n, :forums

  # Properties
  property :id , Serial
  property :building_id , Integer
  property :apartment_id , Integer ,:required => true
  property :surname , String ,:required => true
  property :name , String ,:required => true
  property :occupation , String
  property :birthday , Date
  property :app_phone , String
  property :mobile , String
  property :receive_mails , Boolean  ,:default => false
  property :is_active , Boolean  ,:default => false
  property :is_owner , Boolean  ,:default => true
  property :is_vaad , Boolean  ,:default => false
  property :role , String  ,:default => 'tenant'
  property :is_admin , Boolean  ,:default => false
  property :email , String ,:required => true
  property :crypted_password , String ,:required => true
  property :password_salt , String ,:required => true
  property :reset_password_token , String
  property :reset_password_sent_at , DateTime
  property :remember_created_at , DateTime
  property :avatar_file_name , String
  property :avatar_content_type , String
  property :avatar_file_size , Integer
  property :avatar_updated_at , Date
  property :created_at , DateTime
  property :updated_at , DateTime

  # Validations
  validates_presence_of      :email, :role
  validates_presence_of      :password,                          :if => :password_required
  validates_presence_of      :password_confirmation,             :if => :password_required
  validates_length_of        :password, :min => 4, :max => 40,   :if => :password_required
  validates_confirmation_of  :password,                          :if => :password_required
  validates_length_of        :email,    :min => 3, :max => 100
  validates_uniqueness_of    :email,    :case_sensitive => false
  validates_format_of        :email,    :with => :email_address
  validates_format_of        :role,     :with => /[A-Za-z]/

  # Callbacks
  before :save, :encrypt_password

  ##
  # This method is for authentication purpose
  #
  def self.authenticate(email, password)
    account = first(:conditions => { :email => email }) if email.present?
    account && account.has_password?(password) ? account : nil
  end

  ##
  # This method is used by AuthenticationHelper
  #
  def self.find_by_id(id)
    get(id) rescue nil
  end

  def has_password?(password)
    ::BCrypt::Password.new(crypted_password) == password
  end

  private
  def password_required
    crypted_password.blank? || password.present?
  end

  def encrypt_password
    self.crypted_password = ::BCrypt::Password.create(password) if password.present?
  end

  def self.build
    all(:building_id => $bld_id)
  end

end
