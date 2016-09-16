module Brickset
  class Set
    attr_accessor :id, :number, :number_variant, :name, :year, :theme, :theme_group, :subtheme, :pieces, :minifigs,
                  :image, :image_filename, :thumbnail_url, :large_thumbnail_url, :image_url, :brickset_url, :released,
                  :owned, :wanted, :qty_owned, :acm_data_count, :owned_by_total, :wanted_by_total, :uk_retail_price,
                  :us_retail_price, :ca_retail_price, :eu_retail_price, :us_date_added_to_sah,
                  :us_date_removed_from_sah, :rating, :review_count, :packaging_type, :availability,
                  :instructions_count, :additional_image_count, :ean, :upc, :last_updated
    # setID	Integer	Unique database primary key
    # number	String	e.g. 6876
    # numberVariant	Integer	e.g. 1
    # name	String
    # year	String
    # theme	String
    # themeGroup	String	As used on http://brickset.com/browse/sets
    # subtheme	String
    # pieces	String	Integer, or null if pieces not known.
    # minifigs	String	Integer, or null if no minifigs or not known.
    # image	Boolean
    # imageFilename	String	Returned only if an image is available (image=true)
    # thumbnailURL	String	Returned only if an image is available (image=true). Max dimensions 96x72.
    # largeThumbnailURL	String	Returned only if an image is available (image=true). Max dimensions 240x180.
    # imageURL	String	Returned only if an image is available (image=true). Max dimensions 690x690.
    # bricksetURL	String	URL of set details page at Brickset.com
    # released	Boolean
    # owned	Boolean	Returned only if userHash or userName is passed to method
    # wanted	Boolean	Returned only if userHash or userName is passed to method
    # qtyOwned	Integer	Returned only if userHash or userName is passed to method
    # ACMDataCount	Integer	Number of ACM records user has modified for this set
    # userNotes	String	Returned only if userHash or userName is passed to method
    # ownedByTotal	Integer	Number of people who own this set
    # wantedByTotal	Integer	Number of people who want this set
    # UKRetailPrice	String
    # USRetailPrice	String
    # CARetailPrice	String
    # EURetailPrice	String
    # USDateAddedToSAH	String	The date the set was first sold as shop.LEGO.com in the USA
    # USDateRemovedFromSAH	String	The date the set was last sold as shop.LEGO.com in the USA. If USDateAddedToSAH is not blank but this is, it's still available.
    # rating	Decimal
    # reviewCount	Integer
    # packagingType	String
    # availability	String
    # instructionsCount	Integer
    # additionalImageCount	Integer
    # EAN	String
    # UPC	String
    # description	String	Returned only with call to getSet
    # lastUpdated	Date

    def initialize(data)
      @id = data.dig(:set_id).to_i
      @number = data.dig(:number)
      @number_variant = data.dig(:number_variant).to_i
      @name = data.dig(:name)
      @year = data.dig(:year)
      @theme = data.dig(:theme)
      @theme_group = data.dig(:theme_group)
      @subtheme = data.dig(:subtheme)
      @pieces = data.dig(:pieces)
      @minifigs = data.dig(:minifigs)
      @image = data.dig(:image)
      @image_filename = data.dig(:image_filename)
      @thumbnail_url = data.dig(:thumbnail_url)
      @large_thumbnail_url = data.dig(:large_thumbnail_url)
      @image_url = data.dig(:image_url)
      @brickset_url = data.dig(:brickset_url)
      @released = data.dig(:released)
      @owned = data.dig(:owned)
      @wanted = data.dig(:wanted)
      @qty_owned = data.dig(:qty_owned)
      @acm_data_count = data.dig(:acm_data_count).to_i
      @user_notes = data.dig(:user_notes)
      @owned_by_total = data.dig(:owned_by_total).to_i
      @wanted_by_total = data.dig(:wanted_by_total).to_i
      @uk_retail_price = data.dig(:uk_retail_price)
      @us_retail_price = data.dig(:us_retail_price)
      @ca_retail_price = data.dig(:ca_retail_price)
      @eu_retail_price = data.dig(:eu_retail_price)
      @us_date_added_to_sah = data.dig(:us_date_added_to_sah)
      @us_date_removed_from_sah = data.dig(:us_date_removed_from_sah)
      @rating = data.dig(:rating)
      @review_count = data.dig(:review_count).to_i
      @packaging_type = data.dig(:packaging_type)
      @availability = data.dig(:availability)
      @instructions_count = data.dig(:instructions_count).to_i
      @additional_image_count = data.dig(:additional_image_count).to_i
      @ean = data.dig(:ean)
      @upc = data.dig(:upc)
      @description = data.dig(:description)
      @last_updated = data.dig(:last_updated)
    end
  end
end