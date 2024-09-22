require 'rails_helper'

RSpec.describe CultureType, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end

  describe 'associations' do
    it { is_expected.to have_many(:applicants) }
    it { is_expected.to have_many(:companies) }
  end
end
