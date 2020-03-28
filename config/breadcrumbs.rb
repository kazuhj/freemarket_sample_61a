crumb :root do
  link "フリマアプリ", root_path
end

crumb :mypages do
  link "マイページ", mypages_path
end

crumb :profile do
  link "プロフィール", profile_mypages_path
  parent :mypages
end

crumb :card do
  link "支払い方法", card_mypages_path
  parent :mypages
end

crumb :card_create do
  link "クレジットカード情報入力", card_create_mypages_path
  parent :card
end

crumb :identification do
  link "本人情報の登録", identification_mypages_path
  parent :mypages
end

crumb :logout do
  link "ログアウト", logout_mypages_path
  parent :mypages
end

crumb :listing do
  link "出品した商品-出品中", listing_users_path
  parent :mypages
end

crumb :in_progress do
  link "出品した商品-取引中", in_progress_users_path
  parent :mypages
end

crumb :completed do
  link "出品した商品-売却済み", completed_users_path
  parent :mypages
end

crumb :show_mine do
  link "出品商品画面", show_mine_items_path
  parent :listing
end

crumb :purchased do
  link "購入した商品-取引中", purchased_users_path
  parent :mypages
crumb :categories do
  link "カテゴリー一覧", categories_path
  parent :root
end

crumb :category do |category|
  link "#{category.category}", category_path
  parent :categories
end