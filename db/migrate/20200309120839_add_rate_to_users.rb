class AddRateToUsers < ActiveRecord::Migration[5.2]
  def change
    # オプションでつけている「 after: :○○ 」というのは、どのカラムの後に並ぶかを指定している(mysqlで見た際に見やすくする為)
    add_column :users, :family_name,      :string,  null: false, after: :nickname
    add_column :users, :first_name,       :string,  null: false, after: :family_name
    add_column :users, :family_name_kana, :string,  null: false, after: :first_name
    add_column :users, :first_name_kana,  :string,  null: false, after: :family_name_kana
    add_column :users, :birth_year,       :integer, null: false, after: :first_name_kana
    add_column :users, :birth_month,      :integer, null: false, after: :birth_year
    add_column :users, :birth_day,        :integer, null: false, after: :birth_month
    add_column :users, :profile,          :text
    add_column :users, :image,            :text
  end
end
