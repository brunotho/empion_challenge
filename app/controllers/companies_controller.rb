class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to company_path(@company), notice: "Company created"
    else
      render :new, status: 422
    end
  end

  def new
    @company = Company.new
  end

  private

  def company_params
    params.require(:company).permit(:name, :culture_type_id)
  end
end
