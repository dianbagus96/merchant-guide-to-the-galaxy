class Roman
  ARABICS = {
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
    chars = roman.chars

    while !chars.empty?
      digit = chars[0..1]
      if ARABICS[digit.join]
        arabic = ARABICS[digit.join]
        chars.shift 2
      else
        digit = digit[0]
        arabic = ARABICS[digit]
        chars.shift
      end

      result += arabic
    end

    result
  end
end
