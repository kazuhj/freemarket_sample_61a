class RemoveCategoryToItems < ActiveRecord::Migration[5.2]

  def up
    remove_column :items, :category
  end

  def down
    add_column :items, :category, :integer
  end
end
