FactoryBot.define do
  factory :match do
    company { create(:company) }
    applicant { create(:applicant) }
  end
end
