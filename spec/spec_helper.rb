ENV['RAILS_ENV'] ||= 'test'

require_relative 'app/config/environment'
require_relative '../lib/css_media'

require 'rspec/rails'

RSpec.configure do |c|
end

def sprockets_4?
  Gem::Version.new(Sprockets::VERSION) > Gem::Version.new("4.0.x")
end
