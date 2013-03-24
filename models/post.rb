class Post
  include DataMapper::Resource
  property :id , Serial
  property :building_id , Integer
  property :title , String
  property :forum_id , Integer ,:required => true
  property :tenant_id , Integer
  property :on_front , Boolean
  property :sticky , Boolean
  property :post_pic , String
  property :body , Text
  property :tags , String
  property :created_at , DateTime
  property :updated_at , DateTime
  property :author_id , Integer

  belongs_to :forum


private
  def self.build
    all(:building_id => $bld_id)
  end
end
