module VenuePageExtensions
  include Radiant::Taggable
  
  def self.included(base)
    base.class_eval do
      has_many :events, :class_name => "Page", :foreign_key => "venue_id"
    end
  end
  
  desc "Fetches all events associated with this venue"
  tag 'venue:events' do |tag|
  end

  desc "Fetches upcoming events associated with this venue"
  tag 'venue:upcoming_events' do |tag|
  end

  desc "Fetches past events associated with this venue"
  tag 'venue:past_events' do |tag|
  end
  
  ["events", "upcoming_events", "past_events"].each do |collection|
    desc "Iterates through all #{collection.humanize.downcase} associated with this venue."
    tag "venue:#{collection}:each" do |tag|
      
    end
  end

end