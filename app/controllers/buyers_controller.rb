class BuyersController < ApplicationController
  def index

    @q = Listing.with_attached_picture.includes(:category).ransack(params[:q])
    @listings = @q.result
   
  end

  def show
  end

  def edit
  end

  def delete
  end
end
