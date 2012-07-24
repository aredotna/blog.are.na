Jtt.helpers do

  # Extracts out a unique list of connections
  # for a given set of blocks.
  def flatten_connections(blocks)
    (blocks.collect do |block|
      block['connections'].collect do |connection|
        {
          :title => connection['channel']['title'],
          :slug => connection['channel']['slug'],
          :published => connection['channel']['published']
        }
      end
    end).flatten.uniq!
  end

  def get_public_channels(channel)
    channel['channels'].reject { |c| c['published'] == false }
  end

  def channel_connections(blocks, channel)
    blocks.collect do |block|
      block['connections'].collect { |c| c['channel']['id'] == channel['id']}
    end
  end

end
