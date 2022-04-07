class DeliveryRecord < ApplicationRecord
  has_one :purchased_record
end
