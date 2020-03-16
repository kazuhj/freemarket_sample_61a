FactoryBot.define do
  factory :card do
    id               {1}
    customer_number  {"0000000"}
    year             {"0000"}
    month            {"00"}
    security_code    {"00"}
    user_id          {"1"}
  end
end
