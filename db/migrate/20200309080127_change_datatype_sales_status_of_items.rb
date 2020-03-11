class ChangeDatatypeSalesStatusOfItems < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :sales_status, :integer
  end
end
