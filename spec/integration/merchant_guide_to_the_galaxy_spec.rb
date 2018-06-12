require 'open3'

describe 'Merchant\'s Guide to the Galaxy' do
  context 'without a file argument' do
    it 'opens the default input.txt file and returns the correct output' do
      command = 'ruby merchant_guide_to_the_galaxy.rb'
      expected_output = File.open('spec/fixtures/expected_output.txt').read

      stdout, _, _ = Open3.capture3(command)

      expect(stdout).to eq expected_output
    end

    it 'does not print anything to stderr' do
      command = 'ruby merchant_guide_to_the_galaxy.rb'

      _, stderr, _ = Open3.capture3(command)

      expect(stderr).to be_empty
    end
  end

  context 'opening a different file' do
    it 'returns the correct output' do
      command = 'ruby merchant_guide_to_the_galaxy.rb spec/fixtures/test_input.txt'
      expected_output = File.open('spec/fixtures/test_output.txt').read

      stdout, _, _ = Open3.capture3(command)

      expect(stdout).to eq expected_output
    end

    it 'does not print anything to stderr' do
      command = 'ruby merchant_guide_to_the_galaxy.rb'

      _, stderr, _ = Open3.capture3(command)

      expect(stderr).to be_empty
    end
  end

  context 'with an invalid file' do
    it 'prints an error message' do
      command = 'ruby merchant_guide_to_the_galaxy.rb inexistent_file.txt'

      stdout, _, _ = Open3.capture3(command)

      expect(stdout)
        .to match(/Invalid file! Opening 'inexistent_file\.txt' returned: No such file/)
    end

    it 'does not print anything to stderr' do
      command = 'ruby merchant_guide_to_the_galaxy.rb'

      _, stderr, _ = Open3.capture3(command)

      expect(stderr).to be_empty
    end
  end
end
