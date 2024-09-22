class Company < ApplicationRecord
  belongs_to :culture_type
  has_many :matches

  validates :name, presence: true
end
