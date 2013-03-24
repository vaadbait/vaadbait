class Transaction
  include DataMapper::Resource
  property :id , Serial
  property :building_id , Integer
  property :project_id , Integer
  property :category_id , Integer
  property :account_id , Integer
  property :apartment_id , Integer
  property :amount , Numeric
  property :bank_id , Integer
  property :branch , String
  property :chk_no , String
  property :chk_date , Date
  property :reference , String
  property :remarks , String
  property :from_month , Date
  property :to_month , Date
  property :created_at , DateTime
  property :updated_at , DateTime

  belongs_to :account
  belongs_to :apartment
  belongs_to :category
  belongs_to :project


private
  def self.build
    all(:building_id => $bld_id)
  end
end
