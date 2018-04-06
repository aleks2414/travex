class CreateBlocks < ActiveRecord::Migration[5.1]
  def change
    create_table :blocks do |t|
      t.references :experience, foreign_key: true
      t.date :fecha_salida
      t.string :lugar_salida
      t.time :hora_salida
      t.date :fecha_regreso
      t.decimal :precio, default: 0.00
      t.integer :capacidad, default: 0

      t.timestamps
    end
  end
end
