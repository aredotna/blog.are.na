# Helper methods defined here can be accessed in any controller or view in the application

App.helpers do
  def selected_class(block)
    block.selected ? "selected" : "not-selected"
  end

  def image_proxy_path(src, dimensions='900x900')
    "http://d2ss1gpcas6f9e.cloudfront.net/q/resize/#{dimensions}%3E/src/#{CGI.escape(src)}"
  end

  BLOCK_TYPES.each do |type|
    define_method "is_#{type}?" do |block|
      block._class == type.to_s.capitalize
    end
  end

  def is_block?(block)
    block._base_class == "Block"
  end

  def post_date
    @menu.contents.select {|m| m.slug == @post.slug}.first.connected_at
  end

  def next_post_link 
    if @next_post
      "<a href='/#{@next_post.slug}'>Next: #{@next_post.title} &rarr;</a>"
    end
  end

  def item_class(item)
    item_class = ""
    if item.slug == @post.slug
      item_class << " selected"
    end
    item_class
  end

  def next_block(channel, current_block)
    index = channel.contents.index {|b| b.id == current_block.id}
    index = index + 1
    channel.contents[index]
  end

  def connections_list(post)
    html = ""
    post.connections[0..2].each do |connection|
      html << "<li><a href='http://are.na/#{connection.slug}' target='blank'>#{connection.title}</a></li>"
    end
    if post.connections.length > 3
      html << "<li><a href='http://are.na/show/#{post.id}' target='_blank'>And #{post.connections.length - 3} more...</a></li>"
    end
    html
  end

  def contributors_list
    main_author = @post.user
    authors = @post.contents.map do |block|
      block.user
    end
    authors.reject! {|a| a.slug == main_author.slug}
    authors.uniq! {|a| a.slug}
    author_names = authors.map do |a|
      "<a href='http://are.na/#{a.slug}'>#{a.full_name}</a>"
    end
    list = comma_separated_list(author_names)
    if list != ""
      "Contributions by #{list}<br>"
    else
      ""
    end
  end

  def comma_separated_list(array)
    case array.length
    when 0, nil
      ""
    when 1
      array[0]
    when 2
      array.join ' and '
    else 
      array[array.length - 1].insert(0, 'and ')
      array.join(', ')
    end
  end

end
