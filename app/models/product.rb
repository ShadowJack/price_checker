class Product < ActiveRecord::Base
  validates :url, presence: true
  validates :url, format: { with: URI.regexp }, if: Proc.new { |a| a.url.present? }
  validates :aim_price, numericality: { only_integer: true }

  has_many :prices
  belongs_to :user
end
