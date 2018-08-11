class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.references :user, foreign_key: true
      t.references :block, foreign_key: true
      t.integer :habitaciones, default: 0

      t.timestamps
    end
  end
end
