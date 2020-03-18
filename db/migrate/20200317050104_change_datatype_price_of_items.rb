class ChangeDatatypePriceOfItems < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :price, :integer
  end

  def down
    change_column :items, :price, :string
  end
end
