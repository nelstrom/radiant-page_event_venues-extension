# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class PageEventVenuesExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/page_event_venues"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :page_event_venues
  #   end
  # end
  
  def activate
    # admin.tabs.add "Page Event Venues", "/admin/page_event_venues", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Page Event Venues"
  end
  
end
