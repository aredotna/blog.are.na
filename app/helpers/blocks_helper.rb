# Helper methods defined here can be accessed in any controller or view in the application

Jtt.helpers do
  def image_proxy_path(src, dimensions='900x900')
    "http://d2ss1gpcas6f9e.cloudfront.net/?resize=#{dimensions}%3E&src=#{src}"
  end

  def render_full_or_thumb(size)
    size > CHANNEL_SIZE_THRESHOLD
  end

  def render_full_or_thumb_path(size)
    render_full_or_thumb(size) ? "thumbs" : "full"
  end

  def render_full_or_thumb_class(blocks, block)
    render_full_or_thumb(blocks.size) ? block['block_type'] : 'full'
  end

  BLOCK_TYPES.each do |type|
    define_method "block_is_#{type}?" do |block|
      block['block_type'] == type.to_s.capitalize
    end
  end
end
