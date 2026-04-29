class BuyersController < ApplicationController
  def index
    @q = Listing.available.with_attached_picture.includes(:category, :features, :user).ransack(params[:q])
    @listings = @q.result(distinct: true).recent_first
    @categories = Category.order(:title)
  end
end
