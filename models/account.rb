class Account
  include DataMapper::Resource
  property :id , Serial
  property :building_id , Integer
  property :bank_id , Integer
  property :branch , String
  property :account_num , String
  property :remarks , Text
  property :active , Boolean  ,:default => true
  property :created_at , DateTime
  property :updated_at , DateTime


  has n, :transactions

private
  def self.build
    all(:building_id => $bld_id)
  end
end
