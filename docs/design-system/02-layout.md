# Layout Components

Our layout system provides consistent patterns for page structure and component organization.

## Page Container

Basic page layout with header and content:

```erb
<div class="p-6 bg-white dark:bg-gray-900">
  <!-- Page Header -->
  <div class="flex justify-between items-center mb-6">
    <h1 class="text-2xl font-bold text-gray-900 dark:text-white">Page Title</h1>
    <div class="space-x-2">
      <!-- Action Buttons -->
    </div>
  </div>

  <!-- Main Content -->
  <div class="bg-white dark:bg-gray-800 shadow rounded-lg overflow-hidden">
    <!-- Content Here -->
  </div>
</div>
```

## Card Component

Use for contained content sections:

```erb
<div class="bg-white dark:bg-gray-800 shadow rounded-lg overflow-hidden">
  <!-- Card Header -->
  <div class="px-6 py-4 border-b border-gray-200 dark:border-gray-700">
    <h3 class="text-lg font-medium text-gray-900 dark:text-white">Card Title</h3>
  </div>

  <!-- Card Content -->
  <div class="p-6">
    <!-- Content Here -->
  </div>

  <!-- Card Footer -->
  <div class="px-6 py-4 bg-gray-50 dark:bg-gray-700 border-t border-gray-200 dark:border-gray-600">
    <!-- Footer Content -->
  </div>
</div>
```

## Grid Layouts

For responsive grid layouts:

```erb
<!-- 2-Column Grid -->
<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
  <!-- Grid Items -->
</div>

<!-- 3-Column Grid -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
  <!-- Grid Items -->
</div>
```

## Spacing System

Consistent spacing using Tailwind's spacing scale:

```css
Extra Small: 0.5rem (2px) - p-2, m-2
Small: 1rem (4px) - p-4, m-4
Medium: 1.5rem (6px) - p-6, m-6
Large: 2rem (8px) - p-8, m-8
```

## Container Widths

Responsive container widths:

```erb
<main class="container mx-auto px-4 py-8">
  <!-- Content -->
</main>
```

## Best Practices

1. Use consistent spacing with Tailwind's spacing scale
2. Maintain proper vertical rhythm with consistent margins
3. Use responsive design patterns
4. Consider dark mode in all layout components
5. Keep content width reasonable for readability
