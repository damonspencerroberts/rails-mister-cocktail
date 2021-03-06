class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :find_cocktail

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :name)
  end
end
