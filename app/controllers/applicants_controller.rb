class ApplicantsController < ApplicationController
  def index
    @applicants = Applicant.all
  end

  def create
    @applicant = Applicant.new(applicant_params)
    if @applicant.save
      redirect_to applicants_path, notice: "Applicant created"
    else
      render :new, status: 422
    end
  end

  def new
    @applicant = Applicant.new
  end

  private

  def applicant_params
    params.require(:applicant).permit(:first_name, :last_name, :culture_type_id)
  end
end
