class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :image2
      t.references :experience, foreign_key: true

      t.timestamps
    end
  end
end
