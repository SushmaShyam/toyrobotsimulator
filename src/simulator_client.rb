require_relative 'simulator'

simulator = Simulator.new(5,5)

unless ARGV[0].nil? || !File.exist?(ARGV[0])
  File.readlines(ARGV[0]).each do |line|
    directive = Directive.new(line)
    simulator.command(directive)
  end
else
  puts "The first argument should be the path of a file with commands to the simulator"
end
