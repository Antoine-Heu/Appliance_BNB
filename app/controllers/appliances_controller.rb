class AppliancesController < ApplicationController

  def show
    @appliance = Appliance.find(params[:id])
  end

  def create
    @appliance = Appliance.create(appliance_params)
    @appliance.user = current_user
    redirect_to appliance_path(@appliance.id)
  end

  def new
    @appliance = Appliance.new
  end

  private

  def appliance_params
    params.require(:appliance).permit(:name, :price, :description, :category, :condition, :eaters)
  end
end
