class Roman
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
