class Category < ApplicationRecord
  has_many :listings, dependent: :restrict_with_exception
end
