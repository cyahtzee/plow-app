class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  SIZES = ["S", "M", "L", "XL", "XXL"]
  SHOESIZES = ["25", "26", "27", "28", "29"]
  LENGTH = ["163", "159", "168", "173", "174", "181", "188"]
  CATEGORIES = [
    "Accessories",
    "Bindings",
    "Men's Boots",
    "Men's Headwear",
    "Men's Jackets",
    "Men's Pants",
    "Men's Suits",
    "Poles",
    "Skis",
    "Snowboards",
    "Women's Boots",
    "Women's Headwear",
    "Women's Jackets",
    "Women's Pants",
    "Women's Suits"]
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  CONDITIONS = ["New With Tags", "Excellent Used Condition", "Good Used Condition", "Very Used Condition (Distressed)"]
  validates :condition, presence: true, inclusion: { in: CONDITIONS }
  validates :description, presence: true, length: { maximum: 200 }
  validates :location, presence: true
  validates :price_per_day, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0, less_than: 10000 }
  validates :size, presence: true
  validates :title, presence: true, length: { in: 4..50 }, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters" }
end
