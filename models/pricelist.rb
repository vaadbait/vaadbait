class Pricelist
  include DataMapper::Resource
  property :id , Serial
  property :building_id , Integer
  property :apartment_id , Integer  ,:default => 1
  property :start_at , Date
  property :end_at , Date
  property :amount , Numeric
  property :created_at , DateTime
  property :updated_at , DateTime

  belongs_to :apartment


private
  def self.build
    all(:building_id => $bld_id)
  end
end
