class ForeignKeyToCards < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :cards, :users
  end
end
