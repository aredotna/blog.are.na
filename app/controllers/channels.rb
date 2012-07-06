Jtt.controllers :channels do

  DEFAULT_CHANNEL_IDENTIFIER = 'studio-public'

  get :index, :map => "/"  do
    @channel  = Arena.channel(DEFAULT_CHANNEL_IDENTIFIER)
    @channels = @channel['channels']
    @blocks   = @channel['blocks']
    
    render 'channels/index'
  end


  get :show, :with => :id do
    @channel  = Arena.channel(params[:id])
    @channels = @channel['channels']
    @blocks   = @channel['blocks']
    
    render 'channels/index'
  end
end
