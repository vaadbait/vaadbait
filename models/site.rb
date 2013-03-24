class Site
  include DataMapper::Resource
  property :id , Serial
  property :city_id , Integer
  property :site_name , String ,:required => true
  property :description , Text
  property :created_at , DateTime
  property :updated_at , DateTime

  belongs_to :city

  has n, :buildings

private
  def self.build
    all(:building_id => $bld_id)
  end
end
