class CreateInspectionsTable < ActiveRecord::Migration
  def change
    create_table :inspections do |t|
      t.references :maintenance
      t.string :inspection_type
      t.text :notes

      t.timestamps
    end
  end
end
