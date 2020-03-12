class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update, :destroy]


    def index
        if @tea = Tea.find_by_id(params[:tea_id])
            @teas = @tea.reviews
        else
            @teas = Tea.all
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    def new
        @review = Review.new
    end

    def edit
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def review_params
        params.require(:review).permit(:tea_id, :content, :rating, :title)
    end



end
