class Category
  include DataMapper::Resource
  property :id , Serial
  property :building_id , Integer
  property :category_name , String ,:required => true
  property :created_at , DateTime
  property :updated_at , DateTime


  has n, :projects
  has n, :tasks
  has n, :transactions

private
  def self.build
    all(:building_id => $bld_id)
  end
end
