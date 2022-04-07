class PurchasedDeliveryRecord
  include ActiveModel::Model
  attr_accessor :post_code,:delivery_area_id,:city,:address,:building_name,:phone_number,:user_id,:item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code ,format: {with: /\A[0-9]{3}-[0-9]{4}\z/,allow_blank: true}
    validates :delivery_area_id, numericality: {other_than: 0}
    validates :city
    validates :address
    validates :phone_number,format:{with: /\A[0-9]{11}\z/,allow_blank: true}
  end
  

  def save
    purchased_record = PurchasedRecord.create(user_id: user_id,item_id: item_id)
    DeliveryRecord.create(purchased_record_id: purchased_record.id,post_code: post_code, delivery_area_id: delivery_area_id, city: city, address: address, building_name: building_name,phone_number: phone_number)
  end
end