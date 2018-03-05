require 'metal'

describe Metal do
  describe '#add_element' do
    it 'adds an element' do
      galactic_units = ['tar', 'bar']
      galactic_value = 7
      metal_name = 'Mercury'
      metal_credits = 749
      expected_value = metal_credits / galactic_value

      galaxy = instance_double('Galaxy')

      metal = described_class.new(galaxy)

      allow(galaxy)
        .to receive(:value_of)
        .with(galactic_units)
        .and_return(galactic_value)

      metal.add_element(galactic_units: galactic_units,
                        name: metal_name,
                        credits: metal_credits)

      expect(metal.elements).to eq(metal_name => expected_value)
    end
  end

  describe '#convert' do
    it 'converts an element to the correct amount of Credits' do
      galactic_units = ['tar', 'bar']
      galactic_value = 7

      elements = {
        'Mercury' => 100.0
      }

      galaxy = instance_double('Galaxy')

      metal = described_class.new(galaxy)

      allow(galaxy)
        .to receive(:value_of)
        .with(galactic_units)
        .and_return(galactic_value)

      allow(metal)
        .to receive(:elements)
        .and_return(elements)

      value = metal.convert(galactic_units: galactic_units, element: 'Mercury')

      expect(value).to eq 700
    end
  end
end
