class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:name,:detail,:category_id,:status_id,:delivery_charge_id,:delivery_area_id,:delivery_date_id,:price,:image).merge(user_id: current_user.id)
  end

end


