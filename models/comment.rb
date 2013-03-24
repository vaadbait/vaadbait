class Comment
  include DataMapper::Resource
  property :id , Serial
  property :building_id , Integer
  property :subject_id , Integer
  property :tenant_id , Integer
  property :title , String
  property :body , Text
  property :created_at , DateTime
  property :updated_at , DateTime

  belongs_to :subject


private
  def self.build
    all(:building_id => $bld_id)
  end
end
