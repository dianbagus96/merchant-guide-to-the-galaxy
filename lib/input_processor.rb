class InputProcessor
  attr_reader :galaxy, :metal

  ERROR_MSG = 'I have no idea what you are talking about'.freeze
  INVALID_UNIT_MSG = "That's not even a real unit!".freeze

  def initialize(galaxy:, metal:)
    @galaxy = galaxy
    @metal = metal
  end

  def process_line(line)
    case line
    when /^([a-z]*) is (I|V|X|L|C|D|M)$/
      galaxy.add_unit(name: $1, roman_equivalent: $2)
    when /^([a-z ]+) ([A-Z][a-z]+) is (\d+) Credits$/
      metal.add_element(galactic_units: $1.split, name: $2, credits: $3)
    when /^how much is ([a-z ]+)\?$/
      galactic_conversion(galactic_units: $1)
    when /^how many Credits is ([a-z ]+) ([A-Z][a-z]+)/
      metal_conversion(galactic_units: $1, element: $2)
    else
      puts ERROR_MSG
    end
  end

  private

  # TODO: extract to another class
  def galactic_conversion(galactic_units:)
    value = galaxy.value_of(galactic_units.split)

    if value == 0
      puts INVALID_UNIT_MSG
    else
      puts "#{galactic_units}is #{value}"
    end
  end

  # TODO: extract to another class
  def metal_conversion(galactic_units:, element:)
    credits = metal.convert(galactic_units: galactic_units.split,
                            element: element)

    if credits == 0
      puts INVALID_UNIT_MSG
    else
      puts "#{galactic_units} #{element} is #{credits} Credits"
    end
  end
end
