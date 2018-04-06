class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :stripe_token
      t.integer :many, default: 1
      t.references :block, foreign_key: true

      t.timestamps
    end
  end
end
