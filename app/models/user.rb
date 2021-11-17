class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :registerable
  has_many :bookings
  has_many :items, dependent: :destroy
  has_many :bookings_as_owner, through: :items, source: :bookings
  validates :first_name, presence: true
  validates :last_name, presence: true
end
