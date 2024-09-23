require 'rails_helper'

RSpec.describe Match, type: :model do
  subject { create(:match) }

  describe 'associations' do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to belong_to(:applicant) }
  end

  describe '.match_everything' do
    let!(:culture_type_a) { create(:culture_type) }
    let!(:company_a) { create(:company, culture_type: culture_type_a) }
    let!(:applicant_a) { create(:applicant, culture_type: culture_type_a) }

    let!(:culture_type_b) { create(:culture_type) }
    let!(:company_b) { create(:company, culture_type: culture_type_b) }
    let!(:applicant_b) { create(:applicant, culture_type: culture_type_b) }

    it 'creates a match for applicants and companies with the same culture type' do
      Match.match_everything

      expect(Match.count).to eq(2)
      expect(Match.exists?(applicant: applicant_a, company: company_a)).to be true
      expect(Match.exists?(applicant: applicant_b, company: company_b)).to be true
    end
  end
end
