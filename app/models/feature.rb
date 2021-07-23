class Feature < ApplicationRecord
    has_many :feature_listings
    #Separate many to many relationship with joining table feature_listings
    has_many :listings, through: :feature_listings
end
