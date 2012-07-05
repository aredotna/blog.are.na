Jtt.controllers :channel do

  get :index, :map => "/" do
    data = ActiveSupport::JSON.decode(
        RestClient.get("http://are.na/api/v1/channels/studio-public", { :accept => :json })
      )
    
    @channels = data['channels']
    @blocks = data['blocks']
    
    render 'channel/index'
  end

end
