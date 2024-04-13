require 'mongoid'

# Load Mongoid config file
Mongoid.load!(File.join(File.dirname(__FILE__), 'mongoid.yml'), :development)
