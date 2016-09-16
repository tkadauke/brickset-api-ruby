module Brickset
  class Api
    def initialize
      @client = Savon.client(wsdl: Brickset.configuration.wsdl_url, convert_request_keys_to: :none)
      @api_key = Brickset.configuration.api_key
    end

    def operations
      @client.operations
    end

    def themes
      response = call_api(:get_themes)
      Array.wrap(response.body.dig(:get_themes_response, :get_themes_result, :themes))
    end

    def subthemes(theme)
      response = call_api(:get_subthemes, message: {theme: theme})
      Array.wrap(response.body.dig(:get_subthemes_response, :get_subthemes_result, :subthemes))
    end

    def years(theme)
      response = call_api(:get_years, message: {theme: theme})
      Array.wrap(response.body.dig(:get_years_response, :get_years_result, :years))
    end

    def recently_updated(minutes_ago)
      response = call_api(:get_recently_updated_sets, message: {minutesAgo: minutes_ago})
      Array.wrap(response.body.dig(:get_recently_updated_sets_response, :get_recently_updated_sets_result, :sets))
    end

    def sets(user_hash: '',
             query: '',
             theme: '',
             subtheme: '',
             set_number: '',
             year: '',
             owned: '',
             wanted: '',
             order_by: '',
             page_size: '',
             page_number: '',
             user_name: '')
      # although the docs say the parameters are optional they must all be there
      message = {
          userHash: user_hash,
          query: query,
          theme: theme,
          subtheme: subtheme,
          setNumber: set_number,
          year: year,
          owned: owned,
          wanted: wanted,
          orderBy: order_by,
          pageSize: page_size,
          pageNumber: page_number,
          userName: user_name
      }

      response = call_api(:get_sets, message: message)
      Array.wrap(response.body.dig(:get_sets_response, :get_sets_result, :sets))
    end

    def set(id, user_hash: '')
      response = call_api(:get_set, message: {userHash: user_hash, SetID: id})
      response.body.dig(:get_set_response, :get_set_result, :sets)
    end

    def check_key
      response = api_call(:check_key)
      response.body.dig(:check_key_response, :check_key_result) == 'OK'
    end

    def login(username, password)
      response = api_call(:login, message: {username: username, password: password})
      response.body.dig(:login_response, :login_result)
    end

    def instructions(id)
      response = api_call(:get_instructions, message: {setID: id})
      Array.wrap(response.body.dig(:get_instructions_response, :get_instructions_result, :instructions))
    end

    def collection_totals(user_hash)
      response = api_call(:get_collection_totals, message: {userHash: user_hash})
      Array.wrap(response.body.dig(:get_collection_totals_response, :get_collection_totals_result))
    end

    def minifig_collection(user_hash, query: '', owned: '', wanted: '')
      response = api_call(:get_minifig_collection, message: {userHash: user_hash, query: query, owned: owned, wanted: wanted})
      Array.wrap(response.body.dig(:get_minifig_collection_response, :get_minifig_collection_result, :minifig_collection))
    end

    def themes_for_user(user_hash, owned: '', wanted: '')
      response = api_call(:get_themes_for_user, message: {userHash: user_hash, owned: owned, wanted: wanted})
      Array.wrap(response.body.dig(:get_themes_for_user_response, :get_themes_for_user_result, :themes))
    end

    def subthemes_for_user(user_hash, theme, owned: '', wanted: '')
      response = api_call(:get_subthemes_for_user, message: {userHash: user_hash, theme: theme, owned: owned, wanted: wanted})
      Array.wrap(response.body.dig(:get_subthemes_for_user_response, :get_subthemes_for_user_result, :subthemes))
    end

    def years_for_user(user_hash, theme, owned: '', wanted: '')
      response = api_call(:get_years_for_user, message: {userHash: user_hash, theme: theme, owned: owned, wanted: wanted})
      Array.wrap(response.body.dig(:get_years_for_user_response, :get_years_for_user_result, :years))
    end

    private

    def call_api(method, options = {})
      @client.call(method, message: options.merge(apiKey: @api_key))
    end
  end
end