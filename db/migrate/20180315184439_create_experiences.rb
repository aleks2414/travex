class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.boolean :disponible
      t.string :nombre
      t.string :lugar
      t.string :categoria
      t.string :dias
      t.string :foto
      t.string :slug
      t.references :user, foreign_key: true
      t.text :incluye
      t.text :itinerario
      t.text :que_plan
      t.text :recomendaciones
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
