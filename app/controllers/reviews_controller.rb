class ReviewsController < ApplicationController
before_action :require_login, only: [:create, :destroy]
before_action :correct_review, only: [:destroy]

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
  @review.destroy
    flash[:success] = "Review deleted"
    redirect_to current_user
end

private
def set_review
  @review = review.find(params[:id])
end

def review_params
  params.require(:review).permit(:content, :user_id)
end

def correct_review
    @review = Review.find(params[:id])
    unless (current_user[:id] == @review.user_id)
    flash[:danger] = "This is not your login. Do you want to login again?"
    redirect_to current_user
  end
end

def require_logout
  if logged_in?
  flash[:warning] = "You must be logged out to create a new review"
  redirect_to(root_url)
end
end

end
