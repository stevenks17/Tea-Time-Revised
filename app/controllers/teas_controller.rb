class TeasController < ApplicationController
    before_action :set_tea, only:[:show, :edit, :update]
    



    def new
        @tea = Tea.new
        @tea.build_brand
    end


    def create
      @tea = Tea.new(tea_params)
      @tea.user_id = session[:user_id]  
      
      
      if @tea.save
          redirect_to tea_path(@tea)
        else
          @tea.build_brand
          render :new
        end  
    end


    def index
        @teas = Tea.order_by_rating.includes(:brand)
    end

    def show
    end

    def edit
    end

    def update
        if @tea.update(tea_params)
            redirect_to tea_path(@tea)
        else
            render :edit
        end
    end



    private 

    def tea_params
        params.require(:tea).permit(:flavor, :description, :brand_id, brand_attributes: [:name])
    end

    def set_tea
        @tea = Tea.find_by(params[:id])
        redirect_to tea_path if !@tea
    end

    
end
