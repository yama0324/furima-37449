require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規出品' do
    context '新規出品できるとき' do
      it 'image,name,detail,category_id,status_id,delivery_charge_id,delivery_area_id,delivery_date_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規出品できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'detailが空では登録できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Detail can't be blank"
      end
      it 'delivery_charge_idが空では登録できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery charge can't be blank"
      end
      it 'delivery_area_idが空では登録できない' do
        @item.delivery_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery area can't be blank"
      end
      it 'delivery_date_idが空では登録できない' do
        @item.delivery_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery date can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが300円以上でないと登録できない' do 
        @item.price = '200'  
        @item.valid?
        expect(@item.errors.full_messages).to include ('Price must be greater than or equal to 300')
      end
      it 'priceが9,999,999円以下でないと登録できない' do 
        @item.price = '10000000'  
        @item.valid?
        expect(@item.errors.full_messages).to include ('Price must be less than or equal to 9999999')
      end
      it 'priceが半角数字以外は登録できない' do 
        @item.price = '２００'  
        @item.valid?
        expect(@item.errors.full_messages).to include ('Price is not a number')
      end
      it 'user情報がないと登録できない' do 
        @item.user = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include ('User must exist')
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do 
        @item.category_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do 
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do 
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery charge can't be blank"
      end
      it '配送元の地域に「---」が選択されている場合は出品できない' do 
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery area can't be blank"
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do 
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery date can't be blank"
      end
    end
  end
end
