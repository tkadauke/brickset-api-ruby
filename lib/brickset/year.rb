module Brickset
  class Year
    attr_accessor :theme, :year, :set_count
    # theme	String
    # year	String
    # setCount	Integer
    def initialize(data)
      @theme = data.dig(:theme)
      @year = data.dig(:year)
      @set_count = data.dig(:set_count).to_i
    end
  end
end