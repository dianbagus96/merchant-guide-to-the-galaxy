require './lib/galaxy'
require './lib/metal'

class InputProcessor
  attr_reader :galaxy, :metal

  ERROR_MSG = 'I have no idea what you are talking about'.freeze

  def initialize
    @galaxy = Galaxy.new
    @metal = Metal.new(@galaxy)
  end

  def process_line(line)
    case line
    when /^([a-z]*) is (I|V|X|L|C|D|M)$/
      galaxy.add_unit(name: $1, roman_equivalent: $2)
    when /^([a-z ]+) ([A-Z][a-z]+) is (\d+) Credits$/
      metal.add_element(galactic_units: $1.split, name: $2, credits: $3)
    when /^how much is ([a-z ]+)\?$/
      value = galaxy.value_of($1.split)
      puts "#{$1}is #{value}"
    when /^how many Credits is ([a-z ]+) ([A-Z][a-z]+)/
      credits = metal.convert(galactic_units: $1.split, element: $2)
      puts "#{$1} #{$2} is #{credits} Credits"
    else
      puts ERROR_MSG
    end
  end
end
