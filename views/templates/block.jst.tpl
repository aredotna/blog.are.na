<% _.each(collection, function(block) { %>
  <li class="block">
    <h2><%= block.title %></h2>
    <% if (block.block_type === "Text") { %>
      <div class="text">
        <div class="content">
          <%= block.content %>
        </div>
      </div>
    <% } %>

    <% if (block.block_type === "Link") { %>
      <div class="link">
        <div class="content">
          <% if(block.image_display){ %>
            <a href="<%= block.link_url %>" class="external" target="_blank">
              <img src="<%= block.image_display%>" alt="<%= block.title%>" />
            </a>
          <% } %>
          <p><a href="<%= block.link_url%>" class="url external" target="_blank"><%= block.link_url%></a></p>
        </div>
      </div>
    <% } %>

    <% if (block.block_type === "Media") { %>
      <div class="media">
        <div class="content">
          <% if(block.embed_html){ %>
            <%= block.embed_html %>
          <% } %>
        </div>
      </div>
    <% } %>

    <% if (block.block_type === "Image") { %>
      <div class="image">
        <a href="<%= block.image_original %>" class="enlarge">
          <img src="<%= block.image_display %>" alt="<%= block.title %>" />
        </a>
        <% if (block.content) { %>
          <div class="metadata">
            <div class="content">
              <%= block.content %>
            </div>
          </div>
        <% } %>
      </div>
    <% } %>
    
    <div class="meta">
      <span>Originally created by <%= block.username %></span>
      <span>Connected by <%= block.current_connection.username %></span>
      <span>Connected at <%= block.current_connection.created_at %></span>
    </div>

  </li>
<% }); %>