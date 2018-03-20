class AddDescriptionToExperiences < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :descripcion, :text
  end
end
