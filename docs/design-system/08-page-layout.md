# Page Layout

This guide covers our standardized page layout patterns to ensure consistent spacing and alignment across the application.

## Standard Page Container

Every main content page should use this basic structure:

```erb
<div class="max-w-screen-xl mx-auto px-4 py-6">
  <!-- Page content -->
</div>
```

### Container Classes Explained
- `max-w-screen-xl`: Maximum width constraint matching the header
- `mx-auto`: Centers the container
- `px-4`: Consistent horizontal padding
- `py-6`: Vertical padding for content areas

## Page Header Pattern

Standard page header with actions:

```erb
<div class="max-w-screen-xl mx-auto px-4 py-6">
  <div class="flex justify-between items-center mb-6">
    <h1 class="text-2xl font-bold text-gray-900 dark:text-white">Page Title</h1>
    <div class="space-x-2">
      <!-- Action buttons -->
      <%= link_to 'Primary Action',
          path,
          class: 'bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 
                  rounded dark:bg-blue-600 dark:hover:bg-blue-800' %>
      <%= link_to 'Secondary Action',
          path,
          class: 'bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 
                  rounded dark:bg-gray-600 dark:hover:bg-gray-800' %>
    </div>
  </div>

  <!-- Page content -->
</div>
```

## Content Section Patterns

### Card Layout

```erb
<div class="max-w-screen-xl mx-auto px-4 py-6">
  <!-- Page header -->

  <div class="bg-white dark:bg-gray-800 shadow rounded-lg overflow-hidden">
    <div class="p-6">
      <!-- Card content -->
    </div>
  </div>
</div>
```

### Grid Layout

```erb
<div class="max-w-screen-xl mx-auto px-4 py-6">
  <!-- Page header -->

  <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
    <!-- Sidebar -->
    <div class="md:col-span-1">
      <!-- Sidebar content -->
    </div>

    <!-- Main content -->
    <div class="md:col-span-3">
      <!-- Main content -->
    </div>
  </div>
</div>
```

### Form Layout

```erb
<div class="max-w-screen-xl mx-auto px-4 py-6">
  <!-- Page header -->

  <div class="bg-white dark:bg-gray-800 shadow rounded-lg overflow-hidden">
    <div class="p-6">
      <%= form_with(model: resource) do |form| %>
        <!-- Form fields -->
      <% end %>
    </div>
  </div>
</div>
```

## Example Views

### Index Page

```erb
<div class="max-w-screen-xl mx-auto px-4 py-6">
  <div class="flex justify-between items-center mb-6">
    <h1 class="text-2xl font-bold text-gray-900 dark:text-white">Resources</h1>
    <%= link_to 'New Resource',
        new_resource_path,
        class: 'bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 
                rounded dark:bg-blue-600 dark:hover:bg-blue-800' %>
  </div>

  <!-- Filters -->
  <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-6">
    <div class="md:col-span-1">
      <!-- Filter form -->
    </div>

    <div class="md:col-span-3">
      <!-- Results table -->
    </div>
  </div>
</div>
```

### Show Page

```erb
<div class="max-w-screen-xl mx-auto px-4 py-6">
  <div class="flex justify-between items-center mb-6">
    <h1 class="text-2xl font-bold text-gray-900 dark:text-white">Resource Details</h1>
    <div class="space-x-2">
      <%= link_to 'Edit',
          edit_resource_path(@resource),
          class: 'bg-indigo-500 hover:bg-indigo-700 text-white font-bold py-2 px-4 
                  rounded dark:bg-indigo-600 dark:hover:bg-indigo-800' %>
      <%= link_to 'Back',
          resources_path,
          class: 'bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 
                  rounded dark:bg-gray-600 dark:hover:bg-gray-800' %>
    </div>
  </div>

  <div class="bg-white dark:bg-gray-800 shadow rounded-lg overflow-hidden">
    <div class="p-6">
      <!-- Resource details -->
    </div>
  </div>
</div>
```

## Best Practices

1. **Consistent Container Usage**
   - Always wrap main content in the standard container
   - Maintain consistent padding and max-width
   - Use proper spacing between sections

2. **Header Structure**
   - Include page title and actions in header
   - Use consistent spacing below header
   - Maintain proper heading hierarchy

3. **Responsive Design**
   - Use grid layouts for complex pages
   - Consider mobile viewports
   - Maintain readability at all sizes

4. **Dark Mode**
   - Include dark mode classes for all elements
   - Test contrast in both modes
   - Use consistent color patterns

5. **Content Organization**
   - Group related content in cards
   - Use proper spacing between elements
   - Maintain visual hierarchy

## Common Patterns to Avoid

1. **Inconsistent Containers**
   ```erb
   <!-- Don't do this -->
   <div class="container mx-auto"> <!-- Wrong max-width -->
   <div class="p-6"> <!-- Missing max-width and center alignment -->
   ```

2. **Misaligned Content**
   ```erb
   <!-- Don't do this -->
   <div class="max-w-2xl mx-auto"> <!-- Different max-width than header -->
   <div class="px-8"> <!-- Different padding than standard -->
   ```

3. **Missing Dark Mode**
   ```erb
   <!-- Don't do this -->
   <div class="bg-white"> <!-- Missing dark mode class -->
   <h1 class="text-gray-900"> <!-- Missing dark mode text color -->
   ```

## Layout Components

Consider extracting common layouts into partial components:

```erb
<%# app/views/shared/_page_container.html.erb %>
<div class="max-w-screen-xl mx-auto px-4 py-6">
  <%= yield %>
</div>

<%# app/views/shared/_page_header.html.erb %>
<div class="flex justify-between items-center mb-6">
  <h1 class="text-2xl font-bold text-gray-900 dark:text-white"><%= title %></h1>
  <div class="space-x-2">
    <%= actions %>
  </div>
</div>
```

Usage:

```erb
<%= render 'shared/page_container' do %>
  <%= render 'shared/page_header',
      title: 'Page Title',
      actions: render('shared/actions') %>
  
  <!-- Page content -->
<% end %>
```
