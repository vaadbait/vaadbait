class Apptype
  include DataMapper::Resource
  property :id , Serial
  property :building_id , Integer
  property :type_name , String
  property :created_at , DateTime
  property :updated_at , DateTime


  has n, :apartments

private
  def self.build
    all(:building_id => $bld_id)
  end
end
