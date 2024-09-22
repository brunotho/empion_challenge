class Applicant < ApplicationRecord
  belongs_to :culture_type
  has_many :matches

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name, uniqueness: { scope: :last_name }
end
