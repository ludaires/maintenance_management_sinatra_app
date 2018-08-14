class CreateMaintenancesTable < ActiveRecord::Migration
  def change
    create_table :maintenances do |t|
      t.references :equipment
      t.references :user
      t.string :status

      t.timestamps
    end
  end
end
