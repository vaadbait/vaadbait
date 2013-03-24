class Ticket_status
  include DataMapper::Resource
  property :id , Serial
  property :description , Text
  property :opened_by , Integer
  property :title , String ,:required => true
  property :updated_at , DateTime
  property :created_at , DateTime
  property :building_id , Integer



private
  def self.build
    all(:building_id => $bld_id)
  end
end
