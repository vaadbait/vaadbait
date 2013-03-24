class Subject
  include DataMapper::Resource
  property :id , Serial
  property :building_id , Integer
  property :forum_id , Integer
  property :tenant_id , Integer
  property :title , String
  property :body , Text
  property :created_at , DateTime
  property :updated_at , DateTime
  property :author_id , Integer

  belongs_to :forum

  has n, :comments

private
  def self.build
    all(:building_id => $bld_id)
  end
end
