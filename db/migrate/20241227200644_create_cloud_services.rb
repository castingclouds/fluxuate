class CreateCloudServices < ActiveRecord::Migration[7.1]
  def change
    create_table :cloud_services do |t|
      t.string :service_provider
      t.string :service_name
      t.string :service_category

      t.timestamps
    end
  end
end
