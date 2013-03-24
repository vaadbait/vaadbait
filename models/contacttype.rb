class Contacttype
  include DataMapper::Resource
  property :id , Serial
  property :building_id , Integer
  property :contact_id , Integer
  property :cnttype_id , Integer
  property :created_at , DateTime
  property :updated_at , DateTime

  belongs_to :cnttype
  belongs_to :contact


private
  def self.build
    all(:building_id => $bld_id)
  end
end
