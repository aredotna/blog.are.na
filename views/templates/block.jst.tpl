<% _.each(collection, function(block) { %>
  <li class="block">
    <% if (block.block_type === "Text") { %>
      <div class="text">
        <div class="content">
          <%= block.content %>
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

  </li>
<% }); %>