require 'csv'

namespace :import do
  desc 'Import cloud services from CSV file'
  task cloud_services: :environment do
    csv_file = Rails.root.join('db', 'cloud-services', 'merged_cloud_services.csv')
    
    puts "Importing cloud services from #{csv_file}..."
    
    counter = 0
    CSV.foreach(csv_file, headers: true) do |row|
      CloudService.create!(
        service_provider: row['Service_Provider'],
        service_name: row['Service_Name'],
        service_category: row['Service_Category']
      )
      counter += 1
    end
    
    puts "Imported #{counter} cloud services successfully!"
  end
end
