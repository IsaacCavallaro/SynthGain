class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Set a user to have many listings
  has_many :listings

  has_one :user_info, dependent: :destroy

  has_many :payments
end
