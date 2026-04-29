class UserInfo < ApplicationRecord
  belongs_to :user

  has_one_attached :picture

  validates :country, :city, :street, :postcode, presence: true
end
