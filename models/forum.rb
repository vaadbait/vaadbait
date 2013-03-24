class Forum
  include DataMapper::Resource
  property :id , Serial
  property :building_id , Integer
  property :tenant_id , Integer
  property :forum_name , String
  property :description , Text
  property :created_at , DateTime
  property :updated_at , DateTime

  belongs_to :tenant

  has n, :posts
  has n, :subjects

end
