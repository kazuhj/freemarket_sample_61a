FactoryBot.define do
  factory :image do
    image {File.open("#{Rails.root}/public/uploads/image/image/3/Ruby_on_Rails5の上手な使い方.jpg")}
    association :item
  end
end
