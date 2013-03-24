class Apartment
  include DataMapper::Resource
  property :id , Serial
  property :building_id , Integer
  property :apptype_id , Integer ,:required => true ,:default => 1
  property :apt_num , Integer ,:required => true ,:default => 1
  property :floor , Integer ,:required => true ,:default => 1
  property :debit, Float, :default => 0.0
  property :created_at , DateTime
  property :updated_at , DateTime

  belongs_to :apptype

  has n, :maintenances
  has n, :pricelists
  has n, :tenants
  has n, :transactions

private
  def self.build
    all(:building_id => $bld_id)
  end
end
