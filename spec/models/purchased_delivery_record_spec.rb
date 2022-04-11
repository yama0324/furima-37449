require 'rails_helper'

RSpec.describe PurchasedDeliveryRecord, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchased_delivery_record = FactoryBot.build(:purchased_delivery_record, user_id: user.id,item_id: item.id)
    sleep(1)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'user_id,item_id,post_code,delivery_area_id,city,address,building_name,phone_number,tokenが存在すれば登録できる' do
        expect(@purchased_delivery_record).to be_valid
      end
      it 'building_nameがなくても保存ができる' do
        @purchased_delivery_record.building_name = ''
        expect(@purchased_delivery_record).to be_valid
      end
    end

    context '配送先情報の保存ができるとき' do
      it 'user_idがないと保存できない' do
        @purchased_delivery_record.user_id = nil
        @purchased_delivery_record.valid?
        expect(@purchased_delivery_record.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idがないと保存ができない' do
        @purchased_delivery_record.item_id = nil
        @purchased_delivery_record.valid?
        expect(@purchased_delivery_record.errors.full_messages).to include("Item can't be blank")
      end
      it 'post_codeがないと保存ができない' do
        @purchased_delivery_record.post_code = ''
        @purchased_delivery_record.valid?
        expect(@purchased_delivery_record.errors.full_messages).to include("Post code can't be blank")
      end
      it 'delivery_area_idがないと保存ができない' do
        @purchased_delivery_record.delivery_area_id = ''
        @purchased_delivery_record.valid?
        expect(@purchased_delivery_record.errors.full_messages).to include("Delivery area can't be blank")
      end
      it 'delivery_area_idが1の時は保存ができない' do
        @purchased_delivery_record.delivery_area_id = 1
        @purchased_delivery_record.valid?
        expect(@purchased_delivery_record.errors.full_messages).to include("Delivery area can't be blank")
      end
      it 'cityがないと保存ができない' do
        @purchased_delivery_record.city = ''
        @purchased_delivery_record.valid?
        expect(@purchased_delivery_record.errors.full_messages).to include("City can't be blank")
      end
      it 'addressがないと保存ができない' do
        @purchased_delivery_record.address = ''
        @purchased_delivery_record.valid?
        expect(@purchased_delivery_record.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberがないと保存ができない' do
        @purchased_delivery_record.phone_number = ''
        @purchased_delivery_record.valid?
        expect(@purchased_delivery_record.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'post_codeは「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @purchased_delivery_record.post_code = '111111'
        @purchased_delivery_record.valid?
        expect(@purchased_delivery_record.errors.full_messages).to include("Post code is invalid")
      end
      it 'phone_numberは10桁未満の半角数値の場合は保存できないこと' do
        @purchased_delivery_record.phone_number = '000000000'
        @purchased_delivery_record.valid?
        expect(@purchased_delivery_record.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberは12桁以上の半角数値の場合は保存できないこと' do
        @purchased_delivery_record.phone_number = '000000000000'
        @purchased_delivery_record.valid?
        expect(@purchased_delivery_record.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberは半角数字以外が含まれていると保存できないこと' do
        @purchased_delivery_record.phone_number = '00000-00000'
        @purchased_delivery_record.valid?
        expect(@purchased_delivery_record.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenがないと保存ができない' do
        @purchased_delivery_record.token = ''
        @purchased_delivery_record.valid?
        expect(@purchased_delivery_record.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
