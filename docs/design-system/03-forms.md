# Form Elements

Our form components are designed to be accessible, consistent, and work well in both light and dark modes.

## Basic Form Layout

```erb
<%= form_with(model: resource, class: "p-6 space-y-6") do |form| %>
  <!-- Form Fields -->
<% end %>
```

## Text Input Fields

Standard text input with label:

```erb
<div class="space-y-2">
  <%= form.label :field_name, 
      class: "block text-sm font-medium text-gray-700 dark:text-gray-300" %>
  <%= form.text_field :field_name, 
      class: "mt-1 block w-full rounded-md border-gray-300 dark:border-gray-600 
              bg-white dark:bg-gray-700 text-gray-900 dark:text-gray-100 
              shadow-sm focus:border-blue-500 dark:focus:border-blue-400 
              focus:ring-blue-500 dark:focus:ring-blue-400" %>
</div>
```

## Error States

Form-level errors:

```erb
<% if resource.errors.any? %>
  <div class="bg-red-50 dark:bg-red-900 p-4 rounded mb-6">
    <h2 class="text-red-800 dark:text-red-300 font-medium">
      <%= pluralize(resource.errors.count, "error") %> prohibited this record from being saved:
    </h2>
    <ul class="list-disc list-inside mt-2">
      <% resource.errors.full_messages.each do |message| %>
        <li class="text-red-600 dark:text-red-400"><%= message %></li>
      <% end %>
    </ul>
  </div>
<% end %>
```

## Form Actions

Button group for form actions:

```erb
<div class="flex justify-end space-x-3 pt-4">
  <%= link_to 'Cancel', root_path, 
      data: { turbo_frame: "_top" },
      class: "inline-flex items-center px-4 py-2 border border-gray-300 
              dark:border-gray-600 text-sm font-medium rounded-md 
              text-gray-700 dark:text-gray-300 bg-white dark:bg-gray-700 
              hover:bg-gray-50 dark:hover:bg-gray-600" %>
  
  <%= form.submit 'Save Changes', 
      class: "inline-flex items-center px-4 py-2 border border-transparent 
              text-sm font-medium rounded-md text-white bg-blue-600 
              hover:bg-blue-700 dark:bg-blue-500 dark:hover:bg-blue-600" %>
</div>
```

## Select Fields

Dropdown select with label:

```erb
<div class="space-y-2">
  <%= form.label :category, 
      class: "block text-sm font-medium text-gray-700 dark:text-gray-300" %>
  <%= form.select :category, options_for_select(categories),
      {}, # html options
      class: "mt-1 block w-full rounded-md border-gray-300 dark:border-gray-600 
              bg-white dark:bg-gray-700 text-gray-900 dark:text-gray-100 
              shadow-sm focus:border-blue-500 dark:focus:border-blue-400 
              focus:ring-blue-500 dark:focus:ring-blue-400" %>
</div>
```

## Best Practices

1. Always include labels for form fields
2. Use consistent spacing between form elements
3. Provide clear error messages
4. Ensure proper contrast in both light and dark modes
5. Add proper focus states for keyboard navigation
6. Use semantic HTML elements
7. Include proper ARIA attributes when needed
