class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :description
      t.integer :amount

      t.timestamps
    end
  end
end
