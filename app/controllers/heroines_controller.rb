class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def new
    @heroine = Heroine.new
  end

  def show
    @heroine = Heroine.find(params[:id])
  end
  
  def edit
    @heroine = Heroine.find(params[:id])
  end
###
def create
  @heroine = Heroine.new(heroine_params)
  @heroine.save
  # byebug
  redirect_to heroine_path(@heroine)
  end

  def update
    @heroine = Heroine.find(params[:id])
    @heroine.update(heroine_params(:name))
    redirect_to heroine_path(@heroine)
    end
  
    private
  
    def heroine_params
      params.require(:heroine).permit(:name, :super_name, :power_id)
    end
      
end
