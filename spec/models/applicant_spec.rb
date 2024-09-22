require 'rails_helper'

RSpec.describe Applicant, type: :model do
  subject { create(:applicant) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_uniqueness_of(:first_name).scoped_to(:last_name) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:culture_type) }
    it { is_expected.to have_many(:matches) }
  end
end
