require 'rails_helper'

RSpec.describe Match, type: :model do
  subject { create(:match) }

  describe 'associations' do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to belong_to(:applicant) }
  end
end
