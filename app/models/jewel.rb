class Jewel < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :title, :price, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: %i[title description],
    associated_against: {
      user: %i[first_name last_name address]
    },
    using: {
      tsearch: { prefix: true }
    }
end
