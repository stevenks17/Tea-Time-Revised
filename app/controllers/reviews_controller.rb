class ReviewsController < ApplicationController
  before_action :set_review, only:[:show, :edit, :update, :destroy]


    def new
        if @tea = Tea.find_by_id(params[:tea_id])
          @review = @tea.reviews.build
        else
          @review = Review.new
        end
      end
    
      def create
        @review = current_user.reviews.build(review_params)
        if @review.save!
          redirect_to review_path(@review)
        else
          render :new
        end
      end
    
      def show
        @review = Review.find_by_id(params[:id])
      end
    
      def index      
        if @tea = Tea.find_by_id(params[:tea_id])
          @reviews = @tea.reviews
        else
          @reviews = Review.all.order_by_rating
        end
      end

      def edit

      end
  
      def update
        
          @review.update(review_params)
          redirect_to reviews_path(@review)
      end

      def destroy
        @review.destroy
        flash[:delete_review] = "Review Deleted!"
        redirect_to reviews_path(@review)
    end


    
      private
    
      def review_params
          params.require(:review).permit(:tea_id, :content, :rating, :title)
      end
    
      def set_review
          @review = Review.find_by_id(params[:id])
          redirect_to reviews_path if !@review
      end
end
