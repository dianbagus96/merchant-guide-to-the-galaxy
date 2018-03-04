require './lib/roman'

class Galaxy
  attr_reader :units

  def initialize
    @units = {}
    @roman = Roman
  end

  def add_unit(name:, roman_equivalent:)
    units[name] = roman_equivalent
  end
end
