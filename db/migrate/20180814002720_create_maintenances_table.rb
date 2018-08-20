class CreateMaintenancesTable < ActiveRecord::Migration
  def change
    create_table :maintenances do |t|
      t.references :equipment
      t.references :user
      t.string :status
      t.string :next_maintenance_date

      t.timestamps
    end
  end
end
