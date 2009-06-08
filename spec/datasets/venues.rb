class Venues < Dataset::Base
  uses :home_page
  
  def load

    create_page "The Office", 
        :class_name => "VenuePage",
        :street_address => "High st."

  end
end