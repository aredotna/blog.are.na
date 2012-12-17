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
end
