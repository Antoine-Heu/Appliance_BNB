class PagesController < ApplicationController
  def home
    @appliances = Appliance.all
    if params[:query].present?
      @appliances = Appliance.search_by_name_description_and_price(params[:query])
    elsif params[:filter]
      @appliances = Appliance.where(category: params[:filter])
    else
      @appliances = Appliance.all
    end
  end
end
