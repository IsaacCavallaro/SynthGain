class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Set a user to have many listings
  has_many :listings
  # belongs_to :cart

  has_one :user_info, dependent: :destroy

  # accepts_nested_attributes_for :user_info
end
