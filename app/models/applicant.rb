class Applicant < ApplicationRecord
  belongs_to :culture_type
  has_many :matches
  has_many :companies, through: :matches

  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false
  validates :first_name, uniqueness: { scope: :last_name }
end
