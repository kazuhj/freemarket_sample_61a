class ChangeDatatypeSalesStatusOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :sales_status, :integer
  end
end
