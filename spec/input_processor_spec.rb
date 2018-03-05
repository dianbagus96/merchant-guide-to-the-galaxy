require 'input_processor'
require 'tempfile'

describe InputProcessor do
  describe '#process_line' do
    before do
      tempfile = Tempfile.new('stdout')
      @original_stdout = $stdout
      $stdout = tempfile
    end

    after do
      $stdout = @original_stdout
    end

    it 'adds galactical units' do
      line = 'glob is I'

      expect_any_instance_of(Galaxy)
        .to receive(:add_unit)
        .with(name: 'glob', roman_equivalent: 'I')

      described_class.new.process_line line
    end

    it 'adds metal elements' do
      line = 'glob prok Silver is 48 Credits'

      expect_any_instance_of(Metal)
        .to receive(:add_element)
        .with(galactic_units: ['glob', 'prok'], name: 'Silver', credits: '48')

      described_class.new.process_line line
    end

    it 'returns a message if the line could not be parsed correctly' do
      line = 'I wonder how long it would take me to walk to the sun'

      # remap STDOUT to make sure the correct content is printed
      original_stdout = $stdout
      $stdout = Tempfile.new('stdout')

      described_class.new.process_line line

      $stdout.rewind
      expect($stdout.read.strip).to eq described_class::ERROR_MSG

      # restore original STDOUT
      $stdout = original_stdout
    end

    context 'calculating intergalactic units value' do
      it 'calls Galaxy#value_of with the right arguments' do
        line = 'how much is pish tegj ?'

        expect_any_instance_of(Galaxy)
          .to receive(:value_of)
          .with(['pish', 'tegj'])

        described_class.new.process_line line
      end

      it 'prints the correct text' do
        line = 'how much is pish tegj ?'

        allow_any_instance_of(Galaxy)
          .to receive(:value_of)
          .and_return(8)

        # remap STDOUT to make sure the correct content is printed
        original_stdout = $stdout
        $stdout = Tempfile.new('stdout')

        described_class.new.process_line line

        $stdout.rewind
        expect($stdout.read.strip).to eq 'pish tegj is 8'

        # restore original STDOUT
        $stdout = original_stdout
      end
    end

    context 'calculating credits value' do
      it 'calls Metal#convert with the right arguments' do
        line = 'how many Credits is tar bar Mercury'

        expect_any_instance_of(Metal)
          .to receive(:convert)
          .with(galactic_units: ['tar', 'bar'], element: 'Mercury')

        described_class.new.process_line line
      end

      it 'prints the correct text' do
        line = 'how many Credits is tar bar Mercury'

        allow_any_instance_of(Metal)
          .to receive(:convert)
          .and_return(961)

        # remap STDOUT to make sure the correct content is printed
        original_stdout = $stdout
        $stdout = Tempfile.new('stdout')

        described_class.new.process_line line

        $stdout.rewind
        expect($stdout.read.strip).to eq 'tar bar Mercury is 961 Credits'

        # restore original STDOUT
        $stdout = original_stdout
      end
    end
  end
end
