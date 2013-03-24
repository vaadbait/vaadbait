class Building
  include DataMapper::Resource
  property :id , Serial
  property :site_id , Integer ,:required => true
  property :active , Boolean  ,:default => true
  property :street , String ,:required => true
  property :street_num , String ,:required => true
  property :host , String ,:required => true
  property :zipcode , String
  property :max_app , Integer ,:required => true ,:default => 30
  property :min_floor , Integer ,:required => true ,:default => (-2)
  property :max_floor , Integer ,:required => true ,:default => 10
  property :sloggen , String
  property :created_at , DateTime
  property :updated_at , DateTime

  belongs_to :site

  has n, :accounts
  has n, :apartments
  has n, :apptypes
  has n, :categories
  has n, :cnttypes
  has n, :comments
  has n, :contacts
  has n, :contacttypes
  has n, :forums
  has n, :maintenances
  has n, :posts
  has n, :pricelists
  has n, :projects
  has n, :subjects
  has n, :tasks
  has n, :tenants
  has n, :transactions

end
