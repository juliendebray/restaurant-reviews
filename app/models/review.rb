class Review < ActiveRecord::Base
  belongs_to :restaurant
  validates :content, presence: true
  validates :rating, presence: true, numericality: { less_than_or_equal_to: 5 }
end
