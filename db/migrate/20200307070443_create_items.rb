class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :text, null: false
      t.string :condition, null: false
      t.string :price, null: false
      t.string :fee_burden, null: false
      t.string :service, null: false
      t.string :area, null: false
      t.string :handing_time, null: false
      t.string :category, null: false
      t.timestamps
    end
  end
end
