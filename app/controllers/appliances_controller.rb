class AppliancesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def show
    @appliance = Appliance.find(params[:id])
  end

  def create
    @appliance = Appliance.new(appliance_params)
    @appliance.user = current_user
    if @appliance.save
      redirect_to my_profile_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @appliance = Appliance.find(params[:id])
  end

  def update
    @appliance = Appliance.find(params[:id])
    @appliance.update(appliance_params)
    redirect_to appliance_path(@appliance)
  end

  def destroy
    @appliance = Appliance.find(params[:id])
    @appliance.destroy
    redirect_to root_path
  end

  def new
    @appliance = Appliance.new
  end

  private

  def appliance_params
    params.require(:appliance).permit(:name, :price, :description, :category, :condition, :eaters)
  end
end
