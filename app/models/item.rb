class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivary_fee
  belongs_to :prefecture
  belongs_to :delivary_day


  validates :image,        presence: true
  validates :name,         presence: true, length: { maximum: 30 }
  validates :concept,      presence: true, length: { maximum: 1000 }
  validates :price,        presence: true, format: { with:  /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "out of setting range" }

  
  validates :category_id,     presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,    presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivary_fee_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,   presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivary_day_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
end
