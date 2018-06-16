class AddPoliticsToExperience < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :politics, :text
  end
end
