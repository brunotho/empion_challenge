FactoryBot.define do
  factory :culture_type do
    sequence(:name) { |n| "Fantastic #{n}" }
    taste { rand(0..4) }
    sequence(:reaction_time) { |n| n % 501 }
    ambition { %w[low medium high].sample }
  end
end
