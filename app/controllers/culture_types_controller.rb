class CultureTypesController < ApplicationController
  def index
    @culture_types = CultureType.all
  end

  def new
    @culture_type = CultureType.new
  end

  def create
    @culture_type = CultureType.new(culture_type_params)
    if @culture_type.save
      redirect_to culture_types_path, notice: "Culture Type created"
    else
      render :new, status: 422
    end
  end

  private

  def culture_type_params
    params.require(:culture_type).permit(:name, :taste, :reaction_time, :ambition)
  end
end
