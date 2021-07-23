class Listing < ApplicationRecord
  belongs_to :category
  enum condition: { needs_repair: 0, used: 1, like_new: 2 }
  has_many :feature_listings
  #Separate many to many relationship with joining table feature_listings
  has_many :features, through: :feature_listings

  #Checkboxes 
  accepts_nested_attributes_for :feature_listings
end
