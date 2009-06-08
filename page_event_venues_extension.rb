class PageEventVenuesExtension < Radiant::Extension
  version "0.1"
  description "Works with PageEvent and VenuePages extensions, adding an association between Events and Venues."
  url "http://yourwebsite.com/page_event_venues"
  
  def activate
    raise "The page_event_venues extension requires the page_event extension be loaded first!" unless defined?(PageEvent)
    raise "The page_event_venues extension requires the venue_page extension be loaded first!" unless defined?(VenuePage)

    Page.send :include, EventPageExtensions
    VenuePage.send :include, VenuePageExtensions
    # Page.class_eval      { include EventPageExtensions }
    # VenuePage.class_eval { include VenuePageExtensions }
    
    admin.page.edit.add :layout_row, "venue_select"
  end
  
  def deactivate
  end
  
end
