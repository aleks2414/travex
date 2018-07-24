class AddDefaultValueToOrderAttribute < ActiveRecord::Migration[5.1]
def up
  change_column :orders, :many, :integer, default: 0
end
end
