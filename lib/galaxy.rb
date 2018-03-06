require './lib/roman'

class Galaxy
  attr_reader :units, :roman

  def initialize(roman = Roman)
    @units = {}
    @roman = roman
  end

  def add_unit(name:, roman_equivalent:)
    units[name] = roman_equivalent
  end

  def value_of(galactic_units)
    roman_values = galactic_units.map { |unit_name| value_of_unit(unit_name) }

    roman.to_i(roman_values.join)
  end

  private

  def value_of_unit(name)
    units[name]
  end
end
