class PurchasedRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only:[:index,:create]

  def index
    @purcharsed_delivery_record = PurchasedDeliveryRecord.new
  end

  def create
    @purcharsed_delivery_record = PurchasedDeliveryRecord.new(purchased_record_params)
    if @purcharsed_delivery_record.valid?
      @purcharsed_delivery_record.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
    def purchased_record_params
      params.require(:purchased_delivery_record).permit(:post_code,:city,:address,:building_name,:phone_number).merge(user_id: current_user.id,item_id: params[:item_id])
    end

    def non_purchased_item
      @item = Item.find(params[:item_id])
      redirect_to root_path if current_user.id == @item.purchased_record.present?
    end
end
