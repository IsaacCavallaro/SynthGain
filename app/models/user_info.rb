class UserInfo < ApplicationRecord
    belongs_to :user

     #Add picture to user profile
    has_one_attached :picture
end
