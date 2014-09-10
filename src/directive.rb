class Directive
  attr_reader :command
  attr_reader :arguments

  COMMAND_SEPERATOR = ' '
  PARAMETER_SEPERATOR = ','
  def initialize(string)
    components = string.chomp.split(COMMAND_SEPERATOR)
    @command = components.first.downcase.to_sym
    construct_arguments(components[1]) unless components[1].nil?
  end

  private

  def construct_arguments(arguments)
    @arguments = arguments.split(PARAMETER_SEPERATOR)
    @arguments.map! do |argument|      
      clean_argument(argument)
    end
  end
  
  def clean_argument(argument)
    argument.chomp!
    return argument.to_i if argument =~ /\d+/
    argument.to_sym
  end

end
