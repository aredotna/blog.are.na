App.controllers :channels do
  get :index, map: "/"  do
    @channel = Arena.channel(DEFAULT_CHANNEL_IDENTIFIER, { sort: 'created_at', direction: 'desc', per: 10, page: params[:page]})
    # @channel.contents.reverse!
    
    render 'channels/show'
  end


  get :show, map: "/:id" do
    @channel = Arena.channel slug_decode(params[:id])
    
    if request.xhr?
      render 'channels/show', layout: false
    else
      render 'channels/show'
    end
  end
end