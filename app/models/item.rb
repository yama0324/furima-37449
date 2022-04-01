class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_date
  belongs_to :user
  has_one_attached :image

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_date_id, numericality: { other_than: 1, message: "can't be blank" }
end
