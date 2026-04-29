class Listing < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { minimum: 24 }
  validates :availability, inclusion: { in: [true, false] }
  validates :condition, presence: true

  belongs_to :category
  belongs_to :user
  enum condition: { needs_repair: 0, used: 1, like_new: 2 }
  has_many :feature_listings, dependent: :destroy
  has_many :features, through: :feature_listings
  has_many :payments, dependent: :destroy

  accepts_nested_attributes_for :feature_listings
  has_one_attached :picture

  before_save :remove_whitespace

  scope :available, -> { where(availability: true) }
  scope :recent_first, -> { order(created_at: :desc) }

  private

  def remove_whitespace
    self.title = title.strip
    self.description = description.strip
  end
end
