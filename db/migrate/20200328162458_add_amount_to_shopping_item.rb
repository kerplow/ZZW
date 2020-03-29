class AddAmountToShoppingItem < ActiveRecord::Migration[5.0]
  def change
    add_column :shopping_items, :amount, :integer, default: 1
  end
end
