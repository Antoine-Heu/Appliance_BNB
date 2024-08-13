class AppliancesController < ApplicationController

  def show
    @appliance = Appliance.find(params[:id])
  end
end
