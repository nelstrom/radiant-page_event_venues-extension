module VenuePageExtensions
  
  def self.included(base)
    base.class_eval do
      has_many :events, :class_name => "Page", :foreign_key => "venue_id"
    end
  end
  
end