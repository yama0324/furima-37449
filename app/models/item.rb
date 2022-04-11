class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_date
  belongs_to :user
  has_one_attached :image
  has_one :purchased_record

  validates :image,presence: true,presence: {message: "can't be blank"}
  validates :name,presence: true,presence: {message: "can't be blank"}
  validates :detail,presence: true,presence: {message: "can't be blank"}
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_date_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,presence: true,numericality:{only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to:9_999_999,allow_blank: true},format:{with: /\A[0-9]+\z/,allow_blank: true},presence: {message: "can't be blank"}
  
end
