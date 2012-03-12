#= require 'vendor/json2.js'
#= require 'vendor/underscore.js'
#= require 'vendor/backbone.js'

$ ->
  # 
  # Views:
  #
  class ChannelView extends Backbone.View
    template:   JST['templates/block']
    tagName:    "ul"
    className:  "channel"

    events:
      "click .enlarge" : "enlarge"

    initialize: ->
      _.bindAll this, "render"

    enlarge: (e) ->
      e.preventDefault()
      
      target = $(e.currentTarget)
      href   = target.attr('href')

      img    = target.find('img')
      src    = img.attr('src')
      
      img.attr('src', href)
      target.attr('href', src)

    render: ->
      $(@el).html @template(model: @model.toJSON(), collection: @collection.toJSON())
      this

  # 
  # Models:
  # 
  class Block extends Backbone.Model
    initialize: ->
      @channel = window.Channel

    channelConnection: () => 
      _.find(@get('connections'), (connection) =>
        connection.channel_id is @channel.id
      )


  class Channel extends Backbone.Model

  #
  # Collections:
  #
  class BlocksCollection extends Backbone.Collection
    model: Block

    comparator: (block) ->
      date = new Date(block.channelConnection().updated_at)
      - date.valueOf()

  #
  # Router:
  #
  class Blog extends Backbone.Router
    initialize: ->
      @channel = window.Channel
      @blocks  = new BlocksCollection(@channel.get('blocks'))

    routes:
      "" : "home"

    home: ->
      view = new ChannelView(model: @channel, collection: @blocks)
      $("#container").html(view.render().$el)
      console.log('view', view)

  #
  # Init:
  #
  $('#container').addClass('loading')
  url = "http://are.na/api/v1/channels/blog-are-na.json"
  $.getJSON "#{url}?callback=?", (data) ->
    console.log(data)
    $('#container').removeClass('loading')
    window.Channel = new Channel(data)
    App = new Blog()
    Backbone.history.start()