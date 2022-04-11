class PurchasedRecord < ApplicationRecord
  has_one :delivery_record
  belongs_to :user
  belongs_to :item
end
