FactoryBot.define do
  factory :applicant do
    sequence(:first_name) { |n| "Bob #{n}" }
    sequence(:last_name) { |n| "Banana #{n}" }
    culture_type { create(:culture_type) }
  end
end
