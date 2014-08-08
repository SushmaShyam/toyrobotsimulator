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
      argument.chomp!
      if (argument =~ /\d+/) # is a digit
        argument = argument.to_i
      else
        argument = argument.to_sym
      end
    end
  end

end
