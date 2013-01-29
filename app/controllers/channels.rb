App.controllers :channels do

  get :index, map: "/(:id)", :priority => :low do
    @menu = Arena.channel(DEFAULT_CHANNEL_IDENTIFIER, { sort: 'created_at', direction: 'desc', per: 30, page: params[:page]})
    @menu.contents.reject! {|b| b._class != "Channel"}
    
    id = params[:id].class == Array ? params[:id].pop : params[:id]
    if id && @menu.contents.map(&:slug).include?(id)
      @post = Arena.channel id
    else
      @post = Arena.channel @menu.contents.first.slug
    end
    
    @next_post = next_block(@menu, @post)
    render 'channels/show'
  end
end 

