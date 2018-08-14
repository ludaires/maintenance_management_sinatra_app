class CreateCodesTable < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :code, unique: true
      t.string :code_type
      t.string :title

      t.timestamps
    end
  end
end
