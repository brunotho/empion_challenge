class Company < ApplicationRecord
  belongs_to :culture_type
  has_many :matches
  has_many :applicants, through: :matches

  validates :name, presence: true
end
