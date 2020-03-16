FactoryBot.define do
  factory :address do
    id                    {1}
    family_name           {"myouji"}
    first_name            {"name"}
    family_name_kana      {"myouji"}
    first_name_kana       {"name"}
    zip_code              {"0000000"}
    prefecture            {"prefecture"}
    city                  {"city"}
    address               {"address"}
    user_id               {"1"}   
  end
end
