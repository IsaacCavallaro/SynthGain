class Listing < ApplicationRecord
  belongs_to :category
  enum condition: { needs_repair: 0, used: 1, like_new: 2 }
end
