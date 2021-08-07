class BuyersController < ApplicationController
  def index

    @q = Listing.ransack(params[:q])
    @listings = @q.result
    #retrieve all listings from database
    # @listings = Listing.all
    # p @listings
  end

  def show
  end

  def edit
  end

  def delete
  end
end
