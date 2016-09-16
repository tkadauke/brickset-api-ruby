module Brickset
  class MinifigCollection
    attr_accessor :minifig_number, :owned_in_sets, :owned_loose, :owned_total, :wanted
    # minifigNumber	String
    # ownedInSets	Integer
    # ownedLoose	Integer
    # ownedTotal	Integer
    # wanted	Boolean
    def initialize(data)
      @minifig_number = data.dig(:minifig_number)
      @owned_in_sets = data.dig(:owned_in_sets)
      @owned_loose = data.dig(:owned_loose)
      @owned_total = data.dig(:owned_total)
      @wanted = data.dig(:wanted)
    end
  end
end