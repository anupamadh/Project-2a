class ReviewsController < ApplicationController
before_action :require_login, only: [:create, :destroy]

def create
  @review = current_user.reviews.build(review_params)
   if @review.save
     flash[:success] = "Review created!"
     redirect_to current_user
   else
     render 'static_pages/home'
   end
end

def destroy
end

private

def review_params
  params.require(:review).permit(:content, :user_id)
end

end
