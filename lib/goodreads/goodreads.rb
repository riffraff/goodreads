module Goodreads
  API_URL = 'http://www.goodreads.com'
  API_FORMAT = 'xml'
  
  class ServerError < StandardError
    attr_accessor :response
    def initialize(response)
      super "#{response.code}\n#{response.to_s}"
      self.response = response
    end
    def self.from_response(response)
      new(response)
    end
  end
  #for backcompatibility, do not use
  Error = ServerError 
  class Unauthorized < ServerError ; end
  class Forbidden < ServerError ; end
  class NotFound < ServerError ; end
  
  def self.configure(api_key)
    Goodreads::Client.configure({:api_key => api_key})  
  end
end
