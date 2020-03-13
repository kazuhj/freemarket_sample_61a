class ChangeDatatypeStringOfItems < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :condition, :integer
    change_column :items, :fee_burden, :integer
    change_column :items, :service, :integer
    change_column :items, :area, :integer
    change_column :items, :handing_time, :integer
    change_column :items, :category, :integer
  end

  def down
    change_column :items, :condition, :string
    change_column :items, :fee_burden, :string
    change_column :items, :service, :string
    change_column :items, :area, :string
    change_column :items, :handing_time, :string
    change_column :items, :category, :string
  end
end
