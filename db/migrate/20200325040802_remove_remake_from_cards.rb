class RemoveRemakeFromCards < ActiveRecord::Migration[5.2]
  def up
    remove_column :cards, :customer_number, :string
    remove_column :cards, :year, :integer
    remove_column :cards, :month, :integer
    remove_column :cards, :security_code, :integer
  end

  def down
    add_column :cards, :customer_number, :string
    add_column :cards, :year, :integer
    add_column :cards, :month, :integer
    add_column :cards, :security_code, :integer
  end
end
