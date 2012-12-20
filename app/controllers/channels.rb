App.controllers :channels do

  get :index, map: "/"  do
    @menu = Arena.channel(DEFAULT_CHANNEL_IDENTIFIER, { sort: 'created_at', direction: 'desc', per: 30, page: params[:page]})
    @first_post_slug = @menu.contents.first.slug
    @post_date = @menu.contents.first.connected_at
    @post = Arena.channel @first_post_slug
    render 'channels/show'
  end

  get :show, map: "/:id" do
    @menu = Arena.channel(DEFAULT_CHANNEL_IDENTIFIER, { sort: 'created_at', direction: 'desc', per: 30, page: params[:page]})
    @post = Arena.channel slug_decode(params[:id])
    @post_date = @menu.contents.select {|m| m.slug == @post.slug}.first.connected_at
    render 'channels/show'
  end
end

