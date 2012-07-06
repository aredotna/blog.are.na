Jtt.controllers :blocks, :parent => :channels do

  get :show, :with => :id do
    @channel  = Arena.channel(params[:channel_id])
    @channels = @channel['channels']
    @blocks   = @channel['blocks']

    @block    = Arena.block(params[:id])

    render "blocks/show"
  end

end
