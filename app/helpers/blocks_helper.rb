# Helper methods defined here can be accessed in any controller or view in the application

Jtt.helpers do
  def image_proxy_path(src, dimensions='900x900')
    "http://d2ss1gpcas6f9e.cloudfront.net/?resize=#{dimensions}%3E&src=#{src}"
  end
end
