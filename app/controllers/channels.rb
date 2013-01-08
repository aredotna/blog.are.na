App.controllers :channels do

  get :index, map: "/(:id)", :priority => :low  do
    @menu = Arena.channel(DEFAULT_CHANNEL_IDENTIFIER, { sort: 'created_at', direction: 'desc', per: 30, page: params[:page]})
    if params[:id] && @menu.contents.map(&:slug).include?(params[:id])
      @post = Arena.channel params[:id]
    else
      @post = Arena.channel @menu.contents.first.slug
    end
    @next_post = next_block(@menu, @post)
    render 'channels/show'
  end

end 

