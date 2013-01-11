SITE_TITLE = 'Arena / Blog'
DEFAULT_CHANNEL_IDENTIFIER = ENV['ROOT_CHANNEL']
KEY = 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
BLOCK_TYPES = [:image, :text, :link, :media, :attachment, :channel]

Arena.configure do |config|
  config.access_token = ENV['ACCESS_TOKEN']
end