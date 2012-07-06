class Arena

  API_VERSION = 'v1'

  class << self
    def channel(identifier)
      ActiveSupport::JSON.decode(
        RestClient.get "http://are.na/api/#{API_VERSION}/channels/#{identifier}", { :accept => :json }
      )
    end

    def block(id)
      ActiveSupport::JSON.decode(
        RestClient.get "http://are.na/api/#{API_VERSION}/blocks/#{id}", { :accept => :json }
      )
    end
  end

end