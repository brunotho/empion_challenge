require 'rails_helper'

RSpec.describe Company, type: :model do
  subject { create(:company) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:culture_type) }
    it { is_expected.to have_many(:matches) }
  end
end
