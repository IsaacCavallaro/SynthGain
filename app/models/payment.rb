class Payment < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  validates :payment_intent_id, presence: true, uniqueness: true
end
