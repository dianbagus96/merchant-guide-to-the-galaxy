require 'roman'

describe Roman do
  describe '.to_i' do
    it 'converts correctly XLVIII to 48' do
      roman = 'XLVIII'

      expect(described_class.to_i(roman)).to eq 48
    end

    it 'converts correctly CLXIII to 163' do
      roman = 'CLXIII'

      expect(described_class.to_i(roman)).to eq 163
    end

    it 'converts correctly DLXXV to 575' do
      roman = 'DLXXV'

      expect(described_class.to_i(roman)).to eq 575
    end

    it 'converts correctly CMXI to 911' do
      roman = 'CMXI'

      expect(described_class.to_i(roman)).to eq 911
    end

    it 'converts correctly MXXIV to 1029' do
      roman = 'MXXIX'

      expect(described_class.to_i(roman)).to eq 1029
    end

    it 'converts correctly MCMXLIV to 1944' do
      roman = 'MCMXLIV'

      expect(described_class.to_i(roman)).to eq 1944
    end

    it 'converts correctly MMIX to 2006' do
      roman = 'MMIX'

      expect(described_class.to_i(roman)).to eq 2009
    end
  end

  context 'an invalid numeral' do
    it 'should return zero' do
      roman = "IIII"

      expect(described_class.to_i(roman)).to be_zero
    end
  end
end
