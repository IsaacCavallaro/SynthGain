class Listing < ApplicationRecord

  validates :title, presence: true
  validates :price, presence: true

  belongs_to :category
  #Set a listing to relate to one user
  belongs_to :user
  enum condition: { needs_repair: 0, used: 1, like_new: 2 }
  has_many :feature_listings, dependent: :destroy
  #Separate many to many relationship with joining table feature_listings
  has_many :features, through: :feature_listings

  #Checkboxes 
  accepts_nested_attributes_for :feature_listings

  #Add picture to listing
  has_one_attached :picture

  #data santization
  before_save :remove_whitespace

  private 

  # remove any whitespace before saving a listing
  def remove_whitespace
    self.title = self.title.strip
    self.description = self.description.strip
  end
end
