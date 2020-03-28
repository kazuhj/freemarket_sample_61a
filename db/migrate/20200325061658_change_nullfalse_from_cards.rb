class ChangeNullfalseFromCards < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cards, :customer_id, false
    change_column_null :cards, :card_id, false
  end
end
