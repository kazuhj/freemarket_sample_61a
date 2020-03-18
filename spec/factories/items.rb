FactoryBot.define do
  factory :item do
    name                   {"参考書"}
    text                   {"テストです"}
    condition              {"傷や汚れあり"}
    price                  {"1000"}
    fee_burden             {"着払い（購入者負担）"}
    service                {"普通郵便(定形、定形外)"}
    area                   {"新潟県"}
    handing_time           {"1~2日で発送"}
    category               {"レディース"}
    user_id                {"1"}
    updated_at             {"2020-03-12 10:40:52"}
    sales_status           {"出品中"}
    images {[
      FactoryBot.build(:image, item: nil)  #itemと同時にimage作成
    ]}
    # created_atのデータをランダムで表示
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end
