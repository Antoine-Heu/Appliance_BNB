class PagesController < ApplicationController

  def home
    if params[:filter]
      @appliances = Appliance.where(category: params[:filter])
    else
      @appliances = Appliance.all
    end
  end

end
