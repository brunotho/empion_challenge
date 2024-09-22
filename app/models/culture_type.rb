class CultureType < ApplicationRecord
  has_many :companies
  has_many :applicants

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
