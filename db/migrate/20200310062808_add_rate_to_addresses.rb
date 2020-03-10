class AddRateToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :user, foreign_key: true
    add_column :addresses, :family_name,      :string, null: false
    add_column :addresses, :first_name,       :string, null: false
    add_column :addresses, :family_name_kana, :string, null: false
    add_column :addresses, :first_name_kana,  :string, null: false
    add_column :addresses, :zip_code,         :string, null:false
    add_column :addresses, :adress,           :string, null: false
    add_column :addresses, :building,         :string
  end
end
