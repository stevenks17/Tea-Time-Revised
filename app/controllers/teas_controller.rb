class TeasController < ApplicationController
    before_action :set_tea, only:[:show, :edit, :update, :destroy]
    



    def new
        @tea = Tea.new
        @tea.build_brand
    end


    def create
      @tea = current_user.teas.build(tea_params)
      
      
      if @tea.valid?
        @tea.save
          redirect_to new_tea_path(@tea)
        else
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
        
        @tea.update(tea_params)
        redirect_to user_teas_path(current_user.id)
    end

    def destroy
        
        @tea.destroy(tea_params)
        flash[:notice] = "Tea Blend Deleted!"
        redirect_to user_teas_path(current_user.id)
    end


    private 

    def tea_params
        params.require(:tea).permit(:flavor, :description, :brand_id, brand_attributes: [:name])
    end

    def set_tea
        @tea = Tea.find_by_id(params[:id])
        redirect_to tea_path if !@tea
    end

    def set_user
        @user.User.find_by_id(params[:user_id])
    end

    
end
