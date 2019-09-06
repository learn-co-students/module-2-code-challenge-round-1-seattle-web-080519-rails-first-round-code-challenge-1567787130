class HeroinesController < ApplicationController
    def index
        @heroines = Heroine.all
    end
    
    def show
        @heroine = Heroine.find_by(params[:id])
        @heroine_power = @heroine.power
    end

    def new
        @heroine = Heroine.new
    end

    def create
        @heroine = Heroine.new(post_params)
        if @heroine.save
            redirect_to heroine_path(@heroine)
        else 
            render :new
        end
    end

    def edit
        @heroine = Heroine.find(params[:id])
    end

    def update
        @heroine = Heroine.find(params[:id])
        if @heroine.update(post_params)
            redirect_to heroine_path(@heroine)
        else
            render :edit
        end
    end

    def destroy
        @heroine = Heroine.find(params[:id]).destroy
        redirect_to heroines_path
    end

    private
        def post_params
            params.require(:heroine).permit(:name, :power_name, :power_id)
        end
end
