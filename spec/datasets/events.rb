class Events < Dataset::Base
  uses :venues
  
  def load

    create_page "morning training", 
        :event_datetime_start => Time.local(2008,12,25,6,30).to_s(:db),
        :event_datetime_end   => Time.local(2008,12,25,7,30).to_s(:db)
    
    create_page "workday", 
        :event_datetime_start => Time.local(2009,5,1,9,0).to_s(:db),
        :event_datetime_end   => Time.local(2009,5,1,17,0).to_s(:db),
        :venue_id => pages(:the_office).id

  end
end