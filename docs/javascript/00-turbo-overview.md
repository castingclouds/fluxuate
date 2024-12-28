# Turbo Integration

This guide explains how we use Hotwire's Turbo in Fluxuate to create dynamic, reactive interfaces without writing complex JavaScript.

## Key Concepts

1. **Turbo Drive**: Handles navigation by intercepting links and form submissions
2. **Turbo Frames**: Updates specific parts of the page
3. **Turbo Streams**: Delivers live page changes from server-side events

## Basic Setup

Our application is configured with Turbo in `application.js`:

```javascript
import "@hotwired/turbo-rails"
```

## Turbo Frames

### Basic Frame Usage

```erb
<!-- app/views/cloud_services/index.html.erb -->
<%= turbo_frame_tag "cloud-services-table" do %>
  <table>
    <!-- Table content -->
  </table>
<% end %>
```

### Frame Navigation

When linking within frames, specify the target frame:

```erb
<!-- Stay within the frame -->
<%= link_to "View Details", 
    cloud_service_path(service), 
    data: { turbo_frame: "cloud-services-table" } %>

<!-- Break out of the frame -->
<%= link_to "View Details", 
    cloud_service_path(service), 
    data: { turbo_frame: "_top" } %>
```

## Turbo Streams

### Controller Response

```ruby
# app/controllers/cloud_services_controller.rb
def index
  @cloud_services = CloudService.all
  
  respond_to do |format|
    format.html
    format.turbo_stream do
      render turbo_stream: [
        turbo_stream.update("content",
          partial: "table",
          locals: { cloud_services: @cloud_services }
        ),
        turbo_stream.update("service-counts",
          partial: "counts",
          locals: { provider_counts: @provider_counts }
        )
      ]
    end
  end
end
```

### Stream Actions

```erb
<!-- Update content -->
<%= turbo_stream.update "element-id" do %>
  <!-- New content -->
<% end %>

<!-- Append content -->
<%= turbo_stream.append "list" do %>
  <li>New item</li>
<% end %>

<!-- Remove content -->
<%= turbo_stream.remove "item-to-remove" %>
```

## Form Submissions

### Basic Form

```erb
<%= form_with(model: cloud_service) do |form| %>
  <!-- Form fields -->
  <%= form.submit %>
<% end %>
```

### Form with Custom Target

```erb
<%= form_with(model: cloud_service, 
    data: { turbo_frame: "content" }) do |form| %>
  <!-- Form fields -->
<% end %>
```

## JavaScript Integration

### Stimulus Controllers

```javascript
// app/javascript/controllers/theme_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["toggle"]
  
  toggle() {
    document.documentElement.classList.toggle('dark')
    // Save preference to localStorage
    const isDark = document.documentElement.classList.contains('dark')
    localStorage.setItem('darkMode', isDark)
  }
  
  connect() {
    // Load preference from localStorage
    const isDark = localStorage.getItem('darkMode') === 'true'
    document.documentElement.classList.toggle('dark', isDark)
  }
}
```

### Turbo Events

```javascript
// app/javascript/application.js
document.addEventListener("turbo:load", () => {
  // Initialize components after navigation
})

document.addEventListener("turbo:before-cache", () => {
  // Clean up before caching the page
})

document.addEventListener("turbo:submit-start", () => {
  // Handle form submission start
})

document.addEventListener("turbo:submit-end", () => {
  // Handle form submission completion
})
```

## Progress Bar

Custom progress bar styling:

```css
/* app/assets/stylesheets/application.css */
.turbo-progress-bar {
  @apply bg-blue-600 dark:bg-blue-400;
}
```

## Best Practices

1. **Frame Organization**:
   - Use meaningful frame IDs
   - Keep frame responsibilities focused
   - Consider frame nesting carefully

2. **Performance**:
   - Use frame loading indicators
   - Keep frame content lightweight
   - Cache frame responses when appropriate

3. **Error Handling**:
   - Provide fallback content
   - Handle network errors gracefully
   - Show appropriate error messages

4. **Form Submissions**:
   - Use appropriate HTTP methods
   - Handle validation errors within frames
   - Show submission feedback

5. **JavaScript Integration**:
   - Use Stimulus for behavior
   - Listen for Turbo events
   - Clean up resources properly

## Common Patterns

### Lazy Loading

```erb
<%= turbo_frame_tag "lazy-content",
    src: load_more_path,
    loading: "lazy" do %>
  <div class="animate-pulse">
    <!-- Loading placeholder -->
  </div>
<% end %>
```

### Infinite Scroll

```erb
<%= turbo_frame_tag "infinite-scroll" do %>
  <div id="items">
    <%= render @items %>
  </div>
  
  <% if @pagy.next %>
    <%= turbo_frame_tag "next-page",
        src: items_path(page: @pagy.next),
        loading: "lazy" %>
  <% end %>
<% end %>
```

### Modal Dialogs

```erb
<!-- Trigger -->
<%= link_to "Open Modal",
    modal_path,
    data: { turbo_frame: "modal" } %>

<!-- Modal Frame -->
<%= turbo_frame_tag "modal" do %>
  <div class="modal">
    <!-- Modal content -->
    <%= link_to "Close",
        "#",
        data: { turbo_frame: "_top" } %>
  </div>
<% end %>
```
