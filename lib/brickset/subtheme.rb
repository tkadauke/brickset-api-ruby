module Brickset
  class Subtheme
    attr_accessor :theme, :name, :set_count, :year_from, :year_to
    # theme	String
    # subtheme	String
    # setCount	Integer
    # yearFrom	Integer	Populated by getSubthemes method only
    # yearTo	Integer	Populated by getSubthemes method only
    def initialize(data)
      @theme = data.dig(:theme)
      @name = data.dig(:subtheme)
      @set_count = data.dig(:set_count).to_i
      @year_from = data.dig(:year_from).to_i
      @year_to = data.dig(:year_to).to_i
    end
  end
end