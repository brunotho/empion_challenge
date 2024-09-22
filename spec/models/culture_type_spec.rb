require 'rails_helper'

RSpec.describe CultureType, type: :model do
  subject { build(:culture_type) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
    it { is_expected.to validate_inclusion_of(:taste).in_range(0..4) }
    it { is_expected.to validate_inclusion_of(:reaction_time).in_range(0..500) }
    it { is_expected.to validate_inclusion_of(:ambition).in_array(%w[low medium high]) }
    it { is_expected.to validate_uniqueness_of(:taste)
          .scoped_to(:reaction_time, :ambition)
          .with_message("combination must be unique") }
  end

  describe 'associations' do
    it { is_expected.to have_many(:applicants) }
    it { is_expected.to have_many(:companies) }
  end
end
