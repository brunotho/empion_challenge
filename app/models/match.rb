class Match < ApplicationRecord
  belongs_to :company
  belongs_to :applicant

  def self.match_everything
    Match.delete_all

    applicants = Applicant.all
    applicants.each do |applicant|
      companies = Company.where(culture_type: applicant.culture_type)
      companies.each do |company|
        Match.create(applicant: applicant, company: company)
      end
    end
  end
end
