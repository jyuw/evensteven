class AddOutputToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :output, :string, array: true, default: []
  end
end
