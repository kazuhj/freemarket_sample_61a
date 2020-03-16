FactoryBot.define do
  factory :user do
    id                    {1}
    nickname              {"watashi"}
    family_name           {"myouji"}
    first_name            {"name"}
    family_name_kana      {"ミョウジ"}
    first_name_kana       {"ナマエ"}
    birth_year            {"1990"}
    birth_month           {"4"}
    birth_day             {"11"}
    email                 {"kkk@gmail.com"}
    password              {"a234567"}
    password_confirmation {"a234567"}
    
  end
end
