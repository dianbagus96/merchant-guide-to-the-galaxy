class Roman
  # Roman numeral validation regex
  VALID_REGEX = /^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/

  # Roman => Arabic mapping
  MAPPING = {
    'M' => 1000,
    'CM' => 900,
    'D' => 500,
    'CD' => 400,
    'C' => 100,
    'XC' => 90,
    'L' => 50,
    'XL' => 40,
    'X' => 10,
    'IX' => 9,
    'V' => 5,
    'IV' => 4,
    'I' => 1,
  }.freeze

  # Converts a Roman numeral to an Arabic one
  #
  # @param [String] roman The roman numeral to be converted
  # @return [Integer] the arabic numeral resulting from the conversion. It will
  # be zero if the roman numeral is invalid
  #
  # @example Converting a valid Roman numeral
  #   Roman.to_i('III') => 3
  #
  # @example Converting an invalid Roman numeral
  #   Roman.to_i('IIIIII') => 0
  def self.to_i(roman)
    return 0 unless roman.match? VALID_REGEX

    result = 0

    MAPPING.keys.each do |roman_value|
      while roman.start_with?(roman_value)
        roman = roman.slice(roman_value.size, roman.size)
        result += MAPPING[roman_value]
      end
    end

    result
  end
end
