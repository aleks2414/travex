class AddAtributesToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :hab_doble, :integer, default: 0
    add_column :orders, :hab_triple, :integer, default: 0
    add_column :orders, :hab_cuadrupple, :integer, default: 0
    add_column :orders, :menor_ex, :integer, default: 0
    add_column :orders, :total, :float, default: 0
  end
end
