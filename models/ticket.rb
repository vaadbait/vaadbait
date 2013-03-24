class Ticket
  include DataMapper::Resource
  property :id , Serial
  property :building_id , Integer
  property :tenant_id , Integer
  property :title , String ,:required => true
  property :status , String
  property :description , Text
  property :created_at , DateTime
  property :updated_at , DateTime
  property :ticket_status_id , Integer
  property :opened_by , Integer



private
  def self.build
    all(:building_id => $bld_id)
  end
end
