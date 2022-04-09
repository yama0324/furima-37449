class PurchasedRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only:[:index,:create]

  def index
    @purchased_delivery_record = PurchasedDeliveryRecord.new
  end

  def create
    @purchased_delivery_record = PurchasedDeliveryRecord.new(purchased_record_params)
    if @purchased_delivery_record.valid?
      pay_item
      @purchased_delivery_record.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
    def purchased_record_params
      params.require(:purchased_delivery_record).permit(:post_code,:delivery_area_id,:city,:address,:building_name,:phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
    end

    def pay_item
      Payjp.api_key = "sk_test_19b455214eef72282878e88e"  
      Payjp::Charge.create(
        amount: @item.price,  
        card: purchased_record_params[:token],    
        currency: 'jpy'                 
      )
    end

    def non_purchased_item
      @item = Item.find(params[:item_id])
      redirect_to root_path if current_user.id == @item.purchased_record.present?
    end
end
