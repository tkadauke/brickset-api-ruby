require 'savon'
require 'active_support/core_ext/array'
require 'active_support/core_ext/string'

require 'brickset/version'
require 'brickset/configuration'

require 'brickset/api'

require 'brickset/collection_tools'
require 'brickset/instruction'
require 'brickset/minifig_collection'
require 'brickset/set'
require 'brickset/subtheme'
require 'brickset/theme'
require 'brickset/year'

module Brickset
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
