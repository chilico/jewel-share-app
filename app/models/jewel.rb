class Jewel < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, :price, presence: true
end
