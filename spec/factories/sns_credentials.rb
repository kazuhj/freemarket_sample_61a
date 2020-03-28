FactoryBot.define do
  factory :sns_credential do
    provider { "12345678" }
    uid { "google_oauth2" }
    user { nil }
  end
end
