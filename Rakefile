require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :simulate, [:test_path] do |t, args| 
  puts args[:test_path]
  ruby "src/simulator_client.rb #{args[:test_path]}" 
end

task :default => [:simulate]
