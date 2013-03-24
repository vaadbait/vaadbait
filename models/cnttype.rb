class Cnttype
  include DataMapper::Resource
  property :id , Serial
  property :building_id , Integer
  property :cnttype_name , String ,:required => true
  property :created_at , DateTime
  property :updated_at , DateTime


  has n, :contacttypes

private
  def self.build
    all(:building_id => $bld_id)
  end
end
