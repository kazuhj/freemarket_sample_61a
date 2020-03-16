FactoryBot.define do
  factory :address do
    id                    {1}
    family_name           {"myouji"}
    first_name            {"name"}
    family_name_kana      {"ミョウジ"}
    first_name_kana       {"ナマエ"}
    zip_code              {"0000000"}
    prefecture            {"北海道"}
    city                  {"市区町村"}
    address               {"番地"}
    user_id               {"1"}   
  end
end
