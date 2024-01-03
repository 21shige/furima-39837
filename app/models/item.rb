class Item < ApplicationRecord
  has_many :comments
  has_one  :buy
  belongs_to :user
  has_one_attached :image
end
