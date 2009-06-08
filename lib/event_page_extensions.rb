module EventPageExtensions
  include Radiant::Taggable
  
  def self.included(base)
    base.class_eval do
      belongs_to :venue, :class_name => "VenuePage", :foreign_key => "venue_id"
    end
  end
  
  desc %{
    If the current event has an associated venue, everything within this
    tag will reference the page for that venue.
    }
  tag "event:venue" do |tag|
    if tag.locals.page = tag.locals.page.venue
      tag.expand
    end
  end
  
  desc %Q{
    Output the start time for an event with am/pm, supplying minutes
    only if the event does not begin on the hour. e.g. 1pm or 4:30pm
  }
  tag "event:lazy_start_time" do |tag|
    if event = tag.locals.page
      format = (event.event_datetime_start.min == 0) ? "%I%p" : "%I.%M%p"
      event.event_datetime_start.strftime(format).sub(/^0/,"").downcase
    end
  end
  
  desc %Q{
    Output the start time for an event with am/pm, supplying minutes
    only if the event does not begin on the hour. e.g. 1pm or 4:30pm
  }
  tag "event:lazy_end_time" do |tag|
    if event = tag.locals.page
      format = (event.event_datetime_end.min == 0) ? "%I%p" : "%I.%M%p"
      event.event_datetime_end.strftime(format).sub(/^0/,"").downcase
    end
  end
  
  
  
end