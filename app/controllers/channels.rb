Jtt.controllers :channels do
  get :index, :map => "/"  do
    @channel = Arena::Client.channel(DEFAULT_CHANNEL_IDENTIFIER)
    @channels = get_public_channels(@channel)
    @blocks = @channel['blocks'].shuffle!

    render 'channels/show'
  end


  get :show, :map => "/:id" do
    @channel = Arena::Client.channel(
        params[:e] ? params[:id] : slug_decode(params[:id])
      )
    @channels = get_public_channels(@channel)
    @blocks = @channel['blocks']
    
    if request.xhr?
      render 'channels/show', :layout => false
    else
      render 'channels/show'
    end
  end
end