FactoryBot.define do
  factory :applicant do
    first_name { "Bob" }
    last_name { "Banana" }
    culture_type { create(:culture_type) }
  end
end
