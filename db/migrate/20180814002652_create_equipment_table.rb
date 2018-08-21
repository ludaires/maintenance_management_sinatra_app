class CreateEquipmentTable < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :code, unique: true
      t.string :name
      t.string :location
      t.string :calibration_unit
      t.string :calibration_start
      t.string :calibration_end
      t.string :uncertainty

      t.timestamps
    end

    # add_index :equipment, :name
  end
end
