Jtt.controllers :blocks do

  get :show, :map => '/show/:id' do
    data = ActiveSupport::JSON.decode(
        RestClient.get("http://are.na/api/v1/channels/studio-public", { :accept => :json })
      )
    
    @channels = data['channels']
    @blocks   = data['blocks']
    
    @block    = ActiveSupport::JSON.decode(
        RestClient.get("http://are.na/api/v1/blocks/#{params[:id]}", { :accept => :json })
      )

    render "blocks/show"
  end

end
