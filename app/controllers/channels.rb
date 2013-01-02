App.controllers :channels do

  get :index, map: "/"  do
    @menu = Arena.channel(DEFAULT_CHANNEL_IDENTIFIER, { sort: 'created_at', direction: 'desc', per: 30, page: params[:page]})
    @post = Arena.channel @menu.contents.first.slug
    render 'channels/show'
  end

  get :show, map: "/:id" do
    @menu = Arena.channel(DEFAULT_CHANNEL_IDENTIFIER, { sort: 'created_at', direction: 'desc', per: 30, page: params[:page]})
    if @menu.contents.map(&:slug).include? params[:id]
      @post = Arena.channel params[:id]
    else
      @post = Arena.channel @menu.contents.first.slug
    end
    render 'channels/show'
  end
end

