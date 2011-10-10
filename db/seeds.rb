# Loads seed data out of default dir
Rake::Task["db:load_dir"].invoke( "default" )
puts "Default data has been loaded"

SpreeCore::Engine.load_seed if defined?(SpreeCore)
SpreeAuth::Engine.load_seed if defined?(SpreeAuth)
