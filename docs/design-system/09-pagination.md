# Pagination

Our pagination system uses Kaminari with custom styling to match our design system. It provides a consistent and accessible way to navigate through paginated content.

## Basic Structure

The pagination component is built using several partial templates that work together:

```erb
<%# app/views/kaminari/_paginator.html.erb %>
<%= paginator.render do -%>
  <nav class="flex items-center justify-center" role="navigation" aria-label="pagination">
    <div class="relative z-0 inline-flex rounded-md shadow-sm -space-x-px">
      <%= first_page_tag unless current_page.first? %>
      <%= prev_page_tag unless current_page.first? %>
      <% each_page do |page| -%>
        <% if page.display_tag? -%>
          <%= page_tag page %>
        <% elsif !page.was_truncated? -%>
          <%= gap_tag %>
        <% end -%>
      <% end -%>
      <%= next_page_tag unless current_page.last? %>
      <%= last_page_tag unless current_page.last? %>
    </div>
  </nav>
<% end -%>
```

## Page Numbers

### Current Page
```erb
<%# app/views/kaminari/_page.html.erb - Current page %>
<span class="relative inline-flex items-center px-4 py-2 border border-blue-500 
             dark:border-blue-600 bg-blue-50 dark:bg-blue-900 text-blue-600 
             dark:text-blue-300 z-10">
  <%= page %>
</span>
```

### Regular Page
```erb
<%# app/views/kaminari/_page.html.erb - Regular page %>
<%= link_to page, url, 
    class: "relative inline-flex items-center px-4 py-2 border border-gray-300 
            dark:border-gray-600 bg-white dark:bg-gray-700 text-gray-500 
            dark:text-gray-300 hover:bg-gray-50 dark:hover:bg-gray-600" %>
```

## Navigation Buttons

### Previous Page
```erb
<%# app/views/kaminari/_prev_page.html.erb %>
<%= link_to url, 
    class: "relative inline-flex items-center px-2 py-2 border border-gray-300 
            dark:border-gray-600 bg-white dark:bg-gray-700 text-sm text-gray-500 
            dark:text-gray-300 hover:bg-gray-50 dark:hover:bg-gray-600" do %>
  <span class="sr-only">Previous</span>
  <!-- Heroicon name: solid/chevron-left -->
  <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" 
       fill="currentColor" aria-hidden="true">
    <path fill-rule="evenodd" 
          d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 
             1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" 
          clip-rule="evenodd" />
  </svg>
<% end %>
```

### Next Page
```erb
<%# app/views/kaminari/_next_page.html.erb %>
<%= link_to url, 
    class: "relative inline-flex items-center px-2 py-2 border border-gray-300 
            dark:border-gray-600 bg-white dark:bg-gray-700 text-sm text-gray-500 
            dark:text-gray-300 hover:bg-gray-50 dark:hover:bg-gray-600" do %>
  <span class="sr-only">Next</span>
  <!-- Heroicon name: solid/chevron-right -->
  <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" 
       fill="currentColor" aria-hidden="true">
    <path fill-rule="evenodd" 
          d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414
             -1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" 
          clip-rule="evenodd" />
  </svg>
<% end %>
```

## Gap Indicator
```erb
<%# app/views/kaminari/_gap.html.erb %>
<span class="relative inline-flex items-center px-4 py-2 border border-gray-300 
             dark:border-gray-600 bg-white dark:bg-gray-700 text-sm text-gray-700 
             dark:text-gray-300">
  ...
</span>
```

## Usage

In your controller:
```ruby
# app/controllers/resources_controller.rb
def index
  @resources = Resource.page(params[:page]).per(20)
end
```

In your view:
```erb
<div class="px-6 py-6 bg-white dark:bg-gray-800 border-t 
            border-gray-200 dark:border-gray-700">
  <div class="flex justify-center">
    <%= paginate @resources %>
  </div>
</div>
```

## Styling Details

### Container
- Uses flexbox for centering
- Includes proper ARIA roles and labels
- Connected appearance with `-space-x-px`
- Subtle shadow for depth

### Page Numbers
- Current page:
  - Blue border and background
  - Higher z-index (`z-10`) to show full border
  - Distinct styling in both light and dark modes
- Regular pages:
  - Gray borders and hover states
  - Proper dark mode colors
  - Interactive hover effects

### Navigation Buttons
- Accessible with screen readers
- Clear iconography
- Consistent sizing with page numbers
- Proper hover states

## Accessibility Features

1. **Screen Reader Support**
   - Proper ARIA roles
   - Hidden text for navigation buttons
   - Semantic HTML structure

2. **Keyboard Navigation**
   - All links are focusable
   - Visible focus states
   - Logical tab order

3. **Color Contrast**
   - Meets WCAG guidelines
   - Clear visual hierarchy
   - Dark mode support

## Best Practices

1. **Configuration**
   ```ruby
   # config/initializers/kaminari_config.rb
   Kaminari.configure do |config|
     config.default_per_page = 20
     config.max_per_page = 100
     config.window = 2
     config.outer_window = 1
   end
   ```

2. **Controller Setup**
   - Use consistent per-page settings
   - Consider caching for performance
   - Handle empty states gracefully

3. **View Implementation**
   - Place pagination in consistent locations
   - Maintain proper spacing
   - Include loading states for async updates

4. **Styling**
   - Keep connected appearance
   - Ensure current page is distinct
   - Maintain dark mode support
