# Buttons

Our button system provides consistent styling for different types of actions while maintaining accessibility and proper visual hierarchy.

## Primary Buttons

Use for main actions:

```erb
<%= button_to 'Primary Action',
    path,
    class: "inline-flex items-center px-4 py-2 border border-transparent 
            text-sm font-medium rounded-md text-white bg-blue-600 
            hover:bg-blue-700 dark:bg-blue-500 dark:hover:bg-blue-600" %>
```

## Secondary Buttons

Use for secondary actions:

```erb
<%= button_to 'Secondary Action',
    path,
    class: "inline-flex items-center px-4 py-2 border border-gray-300 
            dark:border-gray-600 text-sm font-medium rounded-md 
            text-gray-700 dark:text-gray-300 bg-white dark:bg-gray-700 
            hover:bg-gray-50 dark:hover:bg-gray-600" %>
```

## Danger Buttons

Use for destructive actions:

```erb
<%= button_to 'Delete',
    path,
    method: :delete,
    data: { turbo_confirm: 'Are you sure?' },
    class: "inline-flex items-center px-4 py-2 border border-transparent 
            text-sm font-medium rounded-md text-white bg-red-600 
            hover:bg-red-700 dark:bg-red-500 dark:hover:bg-red-600" %>
```

## Link Buttons

Use for navigation actions:

```erb
<%= link_to 'View Details',
    path,
    data: { turbo_frame: "_top" },
    class: "text-blue-600 dark:text-blue-400 hover:text-blue-900 
            dark:hover:text-blue-300" %>
```

## Button Groups

For related actions:

```erb
<div class="flex justify-end space-x-3">
  <%= link_to 'Cancel',
      path,
      data: { turbo_frame: "_top" },
      class: "inline-flex items-center px-4 py-2 border border-gray-300 
              dark:border-gray-600 text-sm font-medium rounded-md 
              text-gray-700 dark:text-gray-300 bg-white dark:bg-gray-700 
              hover:bg-gray-50 dark:hover:bg-gray-600" %>
              
  <%= button_to 'Save',
      path,
      class: "inline-flex items-center px-4 py-2 border border-transparent 
              text-sm font-medium rounded-md text-white bg-blue-600 
              hover:bg-blue-700 dark:bg-blue-500 dark:hover:bg-blue-600" %>
</div>
```

## Disabled State

Add disabled styling:

```erb
<button disabled
    class="inline-flex items-center px-4 py-2 border border-transparent 
           text-sm font-medium rounded-md text-white bg-blue-400 
           dark:bg-blue-400 cursor-not-allowed">
  Disabled Button
</button>
```

## Loading State

For async actions:

```erb
<button class="inline-flex items-center px-4 py-2 border border-transparent 
               text-sm font-medium rounded-md text-white bg-blue-600 
               hover:bg-blue-700 dark:bg-blue-500 dark:hover:bg-blue-600">
  <svg class="animate-spin -ml-1 mr-3 h-5 w-5 text-white" 
       xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
    <path class="opacity-75" fill="currentColor" 
          d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z">
    </path>
  </svg>
  Processing...
</button>
```

## Best Practices

1. Use appropriate button types for different actions
2. Include hover and focus states
3. Ensure proper contrast ratios
4. Add loading states for async actions
5. Include proper spacing in button groups
6. Use consistent sizing
7. Include proper ARIA attributes when needed
8. Consider mobile touch targets
