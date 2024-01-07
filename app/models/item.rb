class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost_burden
  belongs_to :prefecture
  belongs_to :shipping_days

  has_many :comments
  # has_one  :buy
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true
  validates :explanation, presence: true
  validates :price, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    messages: {
      only_integer: 'is not a number',
      greater_than_or_equal_to: 'must be greater than or equal to 300',
      less_than_or_equal_to: 'must be less than or equal to 9999999'
    }
  }

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :cost_burden_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_days_id, numericality: { other_than: 1, message: "can't be blank" }
end
