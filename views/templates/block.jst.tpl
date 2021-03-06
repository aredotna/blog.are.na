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
        <% if(block.image_display){ %>
          <a href="<%= block.link_url %>" class="external" target="_blank">
            <img src="<%= block.image_display%>" alt="<%= block.title%>" />
          </a>
        <% } %>
        <p><a href="<%= block.link_url%>" class="url external" target="_blank"><%= block.link_url%></a></p>
        
        <div class="metadata">
          <div class="content">
            <%= block.content %>
          </div>
        </div>
          
      </div>
    <% } %>

    <% if (block.block_type === "Media") { %>
      <div class="media">
        <% if(block.embed_html){ %>
          <%= block.embed_html %>
        <% } %>
        <div class="metadata">
          <div class="content">
            <%= block.content %>
          </div>
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
    
    <div class="meta small">
      <span>Originally created by <%= block.username %></span>
      <span class="meta-sep">|</span>
      <% if(block.user_id != block.current_connection.user_id){%>
        <span>Connected by <%= block.current_connection.username %></span>
        <span class="meta-sep">|</span>
      <% } %>
      <span>Connected <%= block.relative_date %></span>
    </div>

  </li>
<% }); %>