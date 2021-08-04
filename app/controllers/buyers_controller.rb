class BuyersController < ApplicationController
  def index
    @listings = Listing.all
    p @listings
  end

  def show
  end

  def edit
  end

  def delete
  end
end
