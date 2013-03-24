class Contact
  include DataMapper::Resource
  property :id , Serial
  property :building_id , Integer
  property :contact_name , String ,:required => true
  property :phone , String
  property :phone2 , String
  property :city , String
  property :remarks , String
  property :created_at , DateTime
  property :updated_at , DateTime
  property :cnttype_id , Integer


  has n, :contacttypes

private
  def self.build
    all(:building_id => $bld_id)
  end
end
