class City
  include DataMapper::Resource
  property :id , Serial
  property :city_name , String ,:required => true
  property :description , Text
  property :created_at , DateTime
  property :updated_at , DateTime


  has n, :sites

private
  def self.build
    all(:building_id => $bld_id)
  end
end
