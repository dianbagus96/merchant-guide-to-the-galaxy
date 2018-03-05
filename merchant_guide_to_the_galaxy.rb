require './lib/input_processor'

INPUT_FILE = 'input.txt'.freeze

input_file = ARGV[0] || INPUT_FILE

begin
  processor = InputProcessor.new

  File.open(input_file).each_line do |line|
    processor.process_line(line)
  end
rescue Errno::ENOENT => e
  puts "Invalid file! Opening '#{input_file}' returned: #{e.message}"
end
