# frozen_string_literal: true

puts "Seeding database..."

# Only run in development or if explicitly allowed in other environments
if Rails.env.development? || ENV['ALLOW_SEED']
  # Clear existing data
  puts "Clearing existing data..."
  User.destroy_all

  # Create sample users
  puts "Creating sample users..."
  
  # Admin user
  User.create!(
    email: 'admin@example.com',
    password: 'password',
    password_confirmation: 'password',
    created_at: 30.days.ago,
    updated_at: 1.day.ago
  )
  
  # Regular users
  users = [
    {
      email: 'alice@example.com',
      password: 'password',
      password_confirmation: 'password',
      created_at: 20.days.ago,
      updated_at: 2.days.ago
    },
    {
      email: 'bob@example.com',
      password: 'password',
      password_confirmation: 'password',
      created_at: 15.days.ago,
      updated_at: 1.day.ago
    },
    {
      email: 'charlie@example.com',
      password: 'password',
      password_confirmation: 'password',
      created_at: 10.days.ago,
      updated_at: 6.hours.ago
    },
    {
      email: 'dana@example.com',
      password: 'password',
      password_confirmation: 'password',
      created_at: 5.days.ago,
      updated_at: 1.hour.ago
    }
  ]
  
  users.each { |user_attrs| User.create!(user_attrs) }
  
  puts "Seeding complete!"
  puts "\nSample users created:"
  puts "- Admin: admin@example.com / password"
  puts "- Alice: alice@example.com / password"
  puts "- Bob: bob@example.com / password"
  puts "- Charlie: charlie@example.com / password"
  puts "- Dana: dana@example.com / password"
  puts "\nTotal users created: #{User.count}"
else
  puts "Seeding is only allowed in development environment by default."
  puts "To seed in other environments, set ALLOW_SEED=true"
end
