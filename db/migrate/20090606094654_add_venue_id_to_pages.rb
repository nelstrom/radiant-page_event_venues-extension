class AddVenueIdToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :venue_id, :integer
  end

  def self.down
    remove_column :pages, :venue_id
  end
end
