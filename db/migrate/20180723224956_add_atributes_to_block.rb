class AddAtributesToBlock < ActiveRecord::Migration[5.1]
  def change
    add_column :blocks, :habitacion_doble, :float, default: 0.0
    add_column :blocks, :habitacion_triple, :float, default: 0.0
    add_column :blocks, :habitacion_cuadruple, :float, default: 0.0
    add_column :blocks, :menor_extra, :float, default: 0.0
  end
end
