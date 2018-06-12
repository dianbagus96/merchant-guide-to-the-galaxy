class Roman
  VALID_REGEX = /^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/

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
