class CreateInspectionPartsTable < ActiveRecord::Migration
  def change
    create_table :inspection_parts do |t|
      t.references :inspection
      t.references :part

      # https://stackoverflow.com/questions/20937792/rails-adding-migration-to-add-an-array-default-empty
      t.string :codes, :string, array: true, default: []
    end
  end
end
