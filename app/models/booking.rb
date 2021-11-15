class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item
  enum status: [:available, :reserved, :pending]
end
