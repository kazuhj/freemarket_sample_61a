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