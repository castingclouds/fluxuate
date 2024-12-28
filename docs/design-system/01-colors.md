# Color System

Our color system is designed to provide consistent visual hierarchy and ensure accessibility across both light and dark modes.

## Light Mode

### Background Colors
```css
Primary Background: bg-white
Secondary Background: bg-gray-50
Card Background: bg-white
```

### Text Colors
```css
Primary Text: text-gray-900
Secondary Text: text-gray-700
Muted Text: text-gray-500
```

### Border Colors
```css
Primary Border: border-gray-200
Secondary Border: border-gray-300
```

### Action Colors
```css
Primary Button: bg-blue-600 hover:bg-blue-700
Secondary Button: bg-gray-500 hover:bg-gray-700
Danger: text-red-600 hover:text-red-900
Success: text-green-600
```

## Dark Mode

### Background Colors
```css
Primary Background: dark:bg-gray-900
Secondary Background: dark:bg-gray-800
Card Background: dark:bg-gray-800
```

### Text Colors
```css
Primary Text: dark:text-white
Secondary Text: dark:text-gray-300
Muted Text: dark:text-gray-400
```

### Border Colors
```css
Primary Border: dark:border-gray-700
Secondary Border: dark:border-gray-600
```

### Action Colors
```css
Primary Button: dark:bg-blue-500 dark:hover:bg-blue-600
Secondary Button: dark:bg-gray-600 dark:hover:bg-gray-800
Danger: dark:text-red-400 dark:hover:text-red-300
Success: dark:text-green-400
```

## Usage Example

```erb
<div class="bg-white dark:bg-gray-900 text-gray-900 dark:text-white">
  <p class="text-gray-700 dark:text-gray-300">
    Secondary text with proper contrast in both modes
  </p>
  <button class="bg-blue-600 hover:bg-blue-700 dark:bg-blue-500 dark:hover:bg-blue-600">
    Primary Action
  </button>
</div>
```
