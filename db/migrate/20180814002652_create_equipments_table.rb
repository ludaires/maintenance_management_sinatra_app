class CreateEquipmentsTable < ActiveRecord::Migration
  def change
    create_table :equipments do |t|
      t.string :code, unique: true
      t.string :name
      t.string :location
      t.string :calibration_unit
      t.float :calibration_start
      t.float :calibration_end
      t.float :uncertainty

      t.timestamps
    end

    add_index :equipments, :name
  end
end
