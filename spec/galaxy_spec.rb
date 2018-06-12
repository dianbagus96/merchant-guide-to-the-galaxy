require 'galaxy'

describe Galaxy do
  describe '#add_unit' do
    it 'adds an unit with the given name and roman_equivalent' do
      galaxy = described_class.new

      galaxy.add_unit(name: 'galactic', roman_equivalent: 'X')

      expect(galaxy.units).to eq('galactic' => 'X')
    end

    it 'overrides the previous unit when adding another with the same name' do
      galaxy = described_class.new

      galaxy.add_unit(name: 'galactic', roman_equivalent: 'X')
      galaxy.add_unit(name: 'galactic', roman_equivalent: 'M')

      expect(galaxy.units).to eq('galactic' => 'M')
    end
  end

  describe '#value_of' do
    it 'calls Roman.to_i with the roman equivalent of the galaxy units' do
      roman = class_double('Roman')

      galaxy = described_class.new(roman)

      units = {
        'ping' => 'X',
        'pong' => 'M',
        'tar' => 'V'
      }

      allow(galaxy)
        .to receive(:units)
        .and_return(units)

      expect(roman)
        .to receive(:to_i)
        .with('XMV')

      galaxy.value_of(['ping', 'pong', 'tar'])
    end

    it 'ignores inexistent units' do
      roman = class_double('Roman')
      galaxy = described_class.new(roman)

      units = {
        'ping' => 'X',
        'pong' => 'M'
      }

      allow(galaxy)
        .to receive(:units)
        .and_return(units)

      expect(roman)
        .to receive(:to_i)
        .with('XM')

      galaxy.value_of(['ping', 'pong', 'glob', 'tar'])
    end
  end
end
