class AddOwnerToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :owner, :string
  end
end
