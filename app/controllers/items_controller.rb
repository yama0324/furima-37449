class ItemsController < ApplicationController

  def index
  end

  private

  def item_params
    params.require(:item).permit(:name,:detail,:category_id,:status_id,:delivery_charge_id,:delivery_area_id,:delivery_date_id,:price,:image).merge(user_id: current_user.id)
end


