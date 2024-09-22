FactoryBot.define do
  factory :company do
    name { "Circus" }
    culture_type { create(:culture_type) }
  end
end
