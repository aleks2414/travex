class CreateBlocks < ActiveRecord::Migration[5.1]
  def change
    create_table :blocks do |t|
      t.references :experience, foreign_key: true
      t.date :fecha_salida
      t.string :lugar_salida
      t.time :hora_salida
      t.date :fecha_regreso
      t.float :precio, default: 0.0
      t.integer :capacidad, default: 0

      t.timestamps
    end
  end
end
