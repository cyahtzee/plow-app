class ItemsController < ApplicationController
  def index
    @items = policy_scope(Item)
  end

  def show
    @item = Item.find(params[:id])
    @booking = Booking.new
    @user = User.find(@item.user_id)
    authorize @item
  end
  # We have routes for new & create but not part of the initial core journey
  # Need to add strong params for create
end
