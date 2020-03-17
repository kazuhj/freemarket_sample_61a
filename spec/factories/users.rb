FactoryBot.define do
  factory :user do
    nickname              {"watashi"}
    family_name           {"myouji"}
    first_name            {"name"}
    family_name_kana      {"myouji"}
    first_name_kana       {"name"}
    birth_year            {"1990"}
    birth_month           {"4"}
    birth_day             {"11"}
    sequence(:email) {Faker::Internet.email}
    password              {"1234567"}
    password_confirmation {"1234567"}
  end
end
