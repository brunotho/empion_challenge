FactoryBot.define do
  factory :culture_type do
    sequence(:name) { |n| "Fantastic #{n}" }
    taste { [ 0, 1, 2, 4 ].sample }
    sequence(:reaction_time) { |n| n % 501 }
    ambition { %w[low medium high].sample }
  end
end
