desc "Force an update to the menu"
task :force_update => :environment do
  puts "Forcing an update of the Cal Dining menu"
  ParserWorker.new.perform
  puts "done."
end