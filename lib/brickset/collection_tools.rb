module Brickset
  class CollectionTotals
    attr_accessor :total_sets_owned, :total_distinct_sets_owned, :total_sets_wanted, :total_minifigs_owned, :total_minifigs_wanted
    # totalSetsOwned	Integer
    # totalDistinctSetsOwned	Integer
    # totalSetsWanted	Integer
    # totalMinifigsOwned	Integer
    # totalMinifigsWanted	Integer
    def initialize(data)
      @total_sets_owned = data.dig(:total_sets_owned)
      @total_distinct_sets_owned = data.dig(:total_distinct_sets_owned)
      @total_sets_wanted = data.dig(:total_sets_wanted)
      @total_minifigs_owned = data.dig(:total_minifigs_owned)
      @total_minifigs_wanted = data.dig(:total_minifigs_wanted)
    end
  end
end