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

  def item_class(item)
    item_class = ""
    if item.slug == @post.slug
      item_class << " selected"
    end
    item_class
  end

  def contributors_list
    main_author = @post.user.full_name
    author_names = @post.contents.map do |block|
      block.user.full_name
    end
    author_names.reject! {|a| a == main_author}
    author_names.uniq!
    comma_separated_list author_names
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
    end
  end

end
