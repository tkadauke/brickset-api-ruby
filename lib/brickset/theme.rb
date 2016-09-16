module Brickset
  class Theme
    attr_accessor :name, :set_count, :subtheme_count, :year_from, :year_to
    # theme	String
    # setCount	Integer
    # subthemeCount	Integer	Populated by getThemes method only
    # yearFrom	Integer	Populated by getThemes method only
    # yearTo	Integer	Populated by getThemes method only
    def initialize(data)
      @name = data.dig(:theme)
      @set_count = data.dig(:set_count).to_i
      @subtheme_count = data.dig(:subtheme_count).to_i
      @year_from = data.dig(:year_from).to_i
      @year_to = data.dig(:year_to).to_i
    end
  end
end