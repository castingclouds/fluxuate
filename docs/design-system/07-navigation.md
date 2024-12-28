# Navigation

Our navigation components provide consistent styling for links and navigation elements.

## Link Styles

Basic link:

```erb
<%= link_to 'View Details',
    path,
    data: { turbo_frame: "_top" },
    class: "text-blue-600 dark:text-blue-400 hover:text-blue-900 
            dark:hover:text-blue-300" %>
```

## Navigation Links

Main navigation:

```erb
<nav class="bg-white dark:bg-gray-800 shadow">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="flex justify-between h-16">
      <div class="flex">
        <%= link_to 'Home',
            root_path,
            class: "inline-flex items-center px-1 pt-1 border-b-2 
                    #{current_page?(root_path) ? 
                      'border-blue-500 text-gray-900 dark:text-white' : 
                      'border-transparent text-gray-500 dark:text-gray-300 
                       hover:border-gray-300 dark:hover:border-gray-600'}" %>
        
        <%= link_to 'Resources',
            resources_path,
            class: "inline-flex items-center px-1 pt-1 border-b-2 
                    #{current_page?(resources_path) ? 
                      'border-blue-500 text-gray-900 dark:text-white' : 
                      'border-transparent text-gray-500 dark:text-gray-300 
                       hover:border-gray-300 dark:hover:border-gray-600'}" %>
      </div>
    </div>
  </div>
</nav>
```

## Breadcrumbs

```erb
<nav class="flex" aria-label="Breadcrumb">
  <ol class="flex items-center space-x-4">
    <li>
      <%= link_to root_path,
          class: "text-gray-400 dark:text-gray-500 hover:text-gray-500 
                  dark:hover:text-gray-400" do %>
        <!-- Heroicon name: home -->
        <svg class="flex-shrink-0 h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
          <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z" />
        </svg>
        <span class="sr-only">Home</span>
      <% end %>
    </li>
    <li>
      <div class="flex items-center">
        <svg class="flex-shrink-0 h-5 w-5 text-gray-300 dark:text-gray-600" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
          <path d="M5.555 17.776l8-16 .894.448-8 16-.894-.448z" />
        </svg>
        <%= link_to 'Resources',
            resources_path,
            class: "ml-4 text-sm font-medium text-gray-500 dark:text-gray-400 
                    hover:text-gray-700 dark:hover:text-gray-300" %>
      </div>
    </li>
  </ol>
</nav>
```

## Pagination

```erb
<div class="px-6 py-6 bg-white dark:bg-gray-800 border-t border-gray-200 dark:border-gray-700">
  <div class="flex justify-center">
    <%= paginate resources, window: 2, class: 'pagination', params: { 
      filter_param: params[:filter_param]
    } %>
  </div>
</div>
```

## Tabs

```erb
<div class="border-b border-gray-200 dark:border-gray-700">
  <nav class="-mb-px flex space-x-8">
    <%= link_to 'Tab 1',
        tab1_path,
        class: "whitespace-nowrap py-4 px-1 border-b-2 font-medium text-sm
                #{current_page?(tab1_path) ? 
                  'border-blue-500 text-blue-600 dark:text-blue-400' : 
                  'border-transparent text-gray-500 dark:text-gray-400 
                   hover:text-gray-700 dark:hover:text-gray-300 
                   hover:border-gray-300 dark:hover:border-gray-600'}" %>
  </nav>
</div>
```

## Best Practices

1. Use consistent hover states
2. Include active states for current page
3. Ensure proper spacing between items
4. Add proper ARIA labels
5. Consider mobile navigation
6. Use semantic HTML elements
7. Include proper Turbo Frame handling
8. Maintain visual hierarchy
