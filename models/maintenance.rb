class Maintenance
  include DataMapper::Resource
  property :id , Serial
  property :building_id , Integer
  property :apartment_id , Integer
  property :start_at , Date
  property :every , Integer
  property :every_type , Integer
  property :cost , Numeric
  property :last_reminder , Date
  property :next_reminder , Date
  property :created_at , DateTime
  property :updated_at , DateTime

  belongs_to :apartment


private
  def self.build
    all(:building_id => $bld_id)
  end
end
