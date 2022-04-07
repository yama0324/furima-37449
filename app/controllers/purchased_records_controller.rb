class PurchasedRecordsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @purchased_record = Purchased_record.create(purchased_record_params)
    Delivery_record.create(delivery_record_params)
    redirect_to root_path
  end

  private
    def purchased_record_params
      params.require(:purchased_record).merge(user_id: current_user.id,item_id: @purchased_record.item_id)
    end

    def delivery_record_params
      params.require(:delivery_record).permit(:post_code,:city,:address,:building_name,:phone_number).merge(purchased_record_id: @purchased_record.id)
    end
    
end
