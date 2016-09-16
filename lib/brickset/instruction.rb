module Brickset
  class Instruction
    attr_accessor :url, :description
    # URL	String
    # description	String
    def initialize(data)
      @url = data.dig(:url)
      @description = data.dig(:description)
    end
  end
end