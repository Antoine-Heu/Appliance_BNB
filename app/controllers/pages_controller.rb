class PagesController < ApplicationController

  def home
    @appliances = Appliance.all
  end

end
