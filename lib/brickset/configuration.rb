class Configuration
  attr_accessor :api_key, :wsdl_url

  DEFAULT_WSDL_URL = 'http://brickset.com/api/v2.asmx?WSDL'

  def initialize
    @api_key = nil
    @wsdl_url = DEFAULT_WSDL_URL
  end
end