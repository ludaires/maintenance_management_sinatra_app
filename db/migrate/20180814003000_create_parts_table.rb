class CreatePartsTable < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :description

      t.timestamps
    end
  end
end
