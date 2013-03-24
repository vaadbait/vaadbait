class Project
  include DataMapper::Resource
  property :id , Serial
  property :building_id , Integer
  property :category_id , Integer ,:required => true ,:default => 0
  property :title , String ,:required => true
  property :description , Text
  property :approx_cost , Numeric
  property :actual_cost , Numeric
  property :approx_start_date , Date
  property :actual_start_date , Date
  property :approx_end_date , Date
  property :actual_end_date , Date
  property :created_at , DateTime
  property :updated_at , DateTime

  belongs_to :category

  has n, :transactions

private
  def self.build
    all(:building_id => $bld_id)
  end
end
