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
end
