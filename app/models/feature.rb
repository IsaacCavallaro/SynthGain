class Feature < ApplicationRecord
  has_many :feature_listings, dependent: :destroy
  has_many :listings, through: :feature_listings
end
