# Tables

Our table components provide consistent styling for data display with proper dark mode support.

## Basic Table Structure

```erb
<div class="overflow-x-auto">
  <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
    <thead class="bg-gray-50 dark:bg-gray-700">
      <tr>
        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 
                   dark:text-gray-300 uppercase tracking-wider">
          Column Header
        </th>
        <!-- More Headers -->
      </tr>
    </thead>
    <tbody class="bg-white dark:bg-gray-800 divide-y divide-gray-200 dark:divide-gray-700">
      <tr class="hover:bg-gray-50 dark:hover:bg-gray-700">
        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 dark:text-gray-200">
          Cell Content
        </td>
        <!-- More Cells -->
      </tr>
    </tbody>
  </table>
</div>
```

## Table with Actions

```erb
<table class="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
  <!-- ... thead ... -->
  <tbody>
    <tr>
      <!-- ... other cells ... -->
      <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
        <%= link_to 'View', resource_path(resource), 
            data: { turbo_frame: "_top" },
            class: "text-blue-600 dark:text-blue-400 hover:text-blue-900 
                    dark:hover:text-blue-300 mr-3" %>
        
        <%= link_to 'Edit', edit_resource_path(resource), 
            data: { turbo_frame: "_top" },
            class: "text-indigo-600 dark:text-indigo-400 hover:text-indigo-900 
                    dark:hover:text-indigo-300 mr-3" %>
        
        <%= link_to 'Delete', resource_path(resource), 
            method: :delete, 
            data: { turbo_method: :delete, turbo_confirm: 'Are you sure?' }, 
            class: "text-red-600 dark:text-red-400 hover:text-red-900 
                    dark:hover:text-red-300" %>
      </td>
    </tr>
  </tbody>
</table>
```

## Table with Pagination

```erb
<div>
  <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
    <!-- Table Content -->
  </table>

  <div class="px-6 py-6 bg-white dark:bg-gray-800 border-t border-gray-200 dark:border-gray-700">
    <div class="flex justify-center">
      <%= paginate resources, window: 2, class: 'pagination' %>
    </div>
  </div>
</div>
```

## Empty State

```erb
<% if resources.empty? %>
  <div class="text-center py-12">
    <h3 class="text-lg font-medium text-gray-900 dark:text-white mb-2">
      No items found
    </h3>
    <p class="text-gray-500 dark:text-gray-400">
      Get started by creating a new item.
    </p>
    <%= link_to 'Create New', new_resource_path,
        class: "mt-4 inline-flex items-center px-4 py-2 border border-transparent 
                text-sm font-medium rounded-md text-white bg-blue-600 
                hover:bg-blue-700 dark:bg-blue-500 dark:hover:bg-blue-600" %>
  </div>
<% end %>
```

## Best Practices

1. Use consistent padding and spacing
2. Include hover states for interactive rows
3. Ensure proper text alignment
4. Make tables responsive
5. Include empty states
6. Use semantic table markup
7. Consider mobile views (possibly using responsive tables or cards)
