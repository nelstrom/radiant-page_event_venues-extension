module EventPageExtensions
  
  def self.included(base)
    base.class_eval do
      belongs_to :venue, :class_name => "VenuePage", :foreign_key => "venue_id"
    end
  end
  
end