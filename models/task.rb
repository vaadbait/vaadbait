class Task
  include DataMapper::Resource
  property :id , Serial
  property :building_id , Integer
  property :category_id , Integer ,:required => true ,:default => 0
  property :tenant_id , Integer ,:required => true ,:default => 0
  property :title , String ,:required => true
  property :status , Integer ,:required => true ,:default => 0
  property :complete_date , Date
  property :due_date , Date
  property :description , Text
  property :created_at , DateTime
  property :updated_at , DateTime

  belongs_to :category


private
  def self.build
    all(:building_id => $bld_id)
  end
end
