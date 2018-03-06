require './lib/input_processor'
require './lib/galaxy'
require './lib/metal'

INPUT_FILE = 'input.txt'.freeze

input_file = ARGV[0] || INPUT_FILE

### Initializing dependencies
galaxy = Galaxy.new
metal = Metal.new(galaxy)
processor = InputProcessor.new(galaxy: galaxy, metal: metal)

### Opens a file and sends line by line to the InputProcessor
begin
  File.open(input_file).each_line do |line|
    processor.process_line(line)
  end
rescue Errno::ENOENT => e
  puts "Invalid file! Opening '#{input_file}' returned: #{e.message}"
end
