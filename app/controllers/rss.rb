App.controllers :rss do

  get :index, map: "/rss", cache: true  do
    blog_channel = Arena.channel(DEFAULT_CHANNEL_IDENTIFIER, { sort: 'created_at', direction: 'desc', per: 20})
    blog_posts = blog_channel.contents
    @posts = blog_posts.map do |p|
      {
        :post_date=>p.connected_at,
        :post_channel=>Arena.channel(p.slug, {per:20})
      }
    end
    haml(:'feed/feed', :format => :xhtml, :escape_html => true, :layout => false)
  end

end

