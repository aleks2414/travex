class AddPeopleToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :mas_adultos, :float, default: 0.0
    add_column :orders, :mas_menores, :float, default: 0.0
  end
end
