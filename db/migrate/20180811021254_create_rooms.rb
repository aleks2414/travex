class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :tipo_habitacion
      t.integer :num_adultos, default: 0
      t.integer :num_menores, default: 0
      t.integer :num_bebes, default: 0
      t.references :user, foreign_key: true
      t.references :package, foreign_key: true

      t.timestamps
    end
  end
end
