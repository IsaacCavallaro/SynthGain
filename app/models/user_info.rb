class UserInfo < ApplicationRecord
    belongs_to :user

     #Add picture to listing
    has_one_attached :picture
end
