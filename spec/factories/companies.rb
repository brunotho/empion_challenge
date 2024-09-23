FactoryBot.define do
  factory :company do
    sequence(:name) { |n| "Circus #{n}" }
    culture_type { create(:culture_type) }
  end
end
