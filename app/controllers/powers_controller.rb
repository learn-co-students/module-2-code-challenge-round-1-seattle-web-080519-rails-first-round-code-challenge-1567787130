class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    @power = Power.find(params[:id])
    @heroines_that_belong_to_power = @power.heroines
  end
end
