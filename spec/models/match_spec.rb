require 'rails_helper'

RSpec.describe Match, type: :model do
  before(:each) do
    Match.delete_all
    Applicant.delete_all
    Company.delete_all
  end

  subject { create(:match) }

  describe 'associations' do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to belong_to(:applicant) }
  end

  describe '.match_everything' do
    context 'when there are no applicants or companies' do
      it 'does not create any matches' do
        Match.match_everything
        expect(Match.count).to eq(0)
      end
    end

  context 'when there are matching applicants and companies' do
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

  context 'when there are no matching applicants and companies' do
    let!(:culture_type_a) { create(:culture_type) }
    let!(:culture_type_b) { create(:culture_type) }
    let!(:company) { create(:company, culture_type: culture_type_a) }
    let!(:applicant) { create(:applicant, culture_type: culture_type_b) }

      it 'does not create any matches' do
        Match.match_everything
        expect(Match.count).to eq(0)
      end
    end
  end

  context 'when there are multiple matches for one entity' do
    let!(:culture_type_a) { create(:culture_type) }
    let!(:applicant) { create(:applicant, culture_type: culture_type_a) }
    let!(:company_a) { create(:company, culture_type: culture_type_a) }
    let!(:company_b) { create(:company, culture_type: culture_type_a) }

    it 'creates multiple matches' do
      Match.match_everything
      expect(Match.count).to eq(2)
      expect(applicant.matches.count).to eq(2)
    end
  end

  context 'when called multiple times' do
    let!(:culture_type) { create(:culture_type) }
    let!(:company) { create(:company, culture_type: culture_type) }
    let!(:applicant) { create(:applicant, culture_type: culture_type) }

    it 'does not create duplicate matches' do
      Match.match_everything
      expect(Match.count).to eq(1)
      Match.match_everything
      expect(Match.count).to eq(1)
    end
  end
end
