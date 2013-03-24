class Bank
  include DataMapper::Resource
  property :id , Serial
  property :bank_name , String
  property :created_at , DateTime
  property :updated_at , DateTime



private
  def self.build
    all(:building_id => $bld_id)
  end
end
