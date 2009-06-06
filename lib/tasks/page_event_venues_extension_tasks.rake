namespace :radiant do
  namespace :extensions do
    namespace :page_event_venues do
      
      desc "Runs the migration of the Page Event Venues extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          PageEventVenuesExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          PageEventVenuesExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Page Event Venues to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from PageEventVenuesExtension"
        Dir[PageEventVenuesExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(PageEventVenuesExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
