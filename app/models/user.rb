class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :registerable
  geocoded_by :location, params: { countrycodes: "jp" }
  after_validation :geocode, if: :will_save_change_to_location?
  has_many :bookings
  has_many :items, dependent: :destroy
  has_many :bookings_as_owner, through: :items, source: :bookings
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_one_attached :photo

  def owner?
    self.items
  end
end
