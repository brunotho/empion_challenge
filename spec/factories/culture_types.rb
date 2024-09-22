FactoryBot.define do
  factory :culture_type do
    sequence(:name) { |n| "Fantastic#{n}" }
  end
end
