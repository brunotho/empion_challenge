class CultureType < ApplicationRecord
  has_many :companies
  has_many :applicants

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :taste, inclusion: { in: [ 0, 1, 2, 4 ] }
  validates :reaction_time, inclusion: { in: 0..500 }
  validates :ambition, inclusion: { in: %w[low medium high] }
  validates :taste, uniqueness: { scope: [ :reaction_time, :ambition ], message: "combination must be unique" }
end
