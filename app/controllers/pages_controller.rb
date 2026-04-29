class PagesController < ApplicationController
  def home
    @featured_listings = Listing.available.recent_first.includes(:category, :user).with_attached_picture.limit(3)
  end

  def about
  end
end
