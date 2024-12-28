# Flash Messages

Our flash message system provides consistent styling for different types of notifications.

## Basic Structure

Add to your layout file:

```erb
<% if notice %>
  <div class="mb-4 p-4 bg-green-100 dark:bg-green-900 border 
              border-green-400 dark:border-green-600 text-green-700 
              dark:text-green-300 rounded">
    <%= notice %>
  </div>
<% end %>

<% if alert %>
  <div class="mb-4 p-4 bg-red-100 dark:bg-red-900 border 
              border-red-400 dark:border-red-600 text-red-700 
              dark:text-red-300 rounded">
    <%= alert %>
  </div>
<% end %>
```

## Success Message

```erb
<div class="mb-4 p-4 bg-green-100 dark:bg-green-900 border 
            border-green-400 dark:border-green-600 text-green-700 
            dark:text-green-300 rounded">
  <div class="flex">
    <div class="flex-shrink-0">
      <!-- Heroicon name: check-circle -->
      <svg class="h-5 w-5 text-green-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
      </svg>
    </div>
    <div class="ml-3">
      <p class="text-sm font-medium">
        Successfully saved changes
      </p>
    </div>
  </div>
</div>
```

## Error Message

```erb
<div class="mb-4 p-4 bg-red-100 dark:bg-red-900 border 
            border-red-400 dark:border-red-600 text-red-700 
            dark:text-red-300 rounded">
  <div class="flex">
    <div class="flex-shrink-0">
      <!-- Heroicon name: x-circle -->
      <svg class="h-5 w-5 text-red-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
      </svg>
    </div>
    <div class="ml-3">
      <p class="text-sm font-medium">
        There was an error processing your request
      </p>
    </div>
  </div>
</div>
```

## Warning Message

```erb
<div class="mb-4 p-4 bg-yellow-100 dark:bg-yellow-900 border 
            border-yellow-400 dark:border-yellow-600 text-yellow-700 
            dark:text-yellow-300 rounded">
  <div class="flex">
    <div class="flex-shrink-0">
      <!-- Heroicon name: exclamation -->
      <svg class="h-5 w-5 text-yellow-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
        <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd" />
      </svg>
    </div>
    <div class="ml-3">
      <p class="text-sm font-medium">
        Please review your information before proceeding
      </p>
    </div>
  </div>
</div>
```

## Info Message

```erb
<div class="mb-4 p-4 bg-blue-100 dark:bg-blue-900 border 
            border-blue-400 dark:border-blue-600 text-blue-700 
            dark:text-blue-300 rounded">
  <div class="flex">
    <div class="flex-shrink-0">
      <!-- Heroicon name: information-circle -->
      <svg class="h-5 w-5 text-blue-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
        <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd" />
      </svg>
    </div>
    <div class="ml-3">
      <p class="text-sm font-medium">
        Important information about your account
      </p>
    </div>
  </div>
</div>
```

## Best Practices

1. Use appropriate colors for different message types
2. Include icons for better visual cues
3. Keep messages concise and clear
4. Position messages where they'll be noticed
5. Consider auto-dismissal for success messages
6. Ensure proper contrast in both modes
7. Make messages dismissible when appropriate
