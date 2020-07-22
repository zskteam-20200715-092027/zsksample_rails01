class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :content, length: { maximum: 140 }
end
