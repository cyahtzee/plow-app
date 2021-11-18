class ItemsController < ApplicationController
  def index
    @items = policy_scope(Item)

    @markers = @items.geocoded.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude,
        info_window: render_to_string(partial: "info_window", locals: { item: item })
      }
    end
  end

  # def search
  # end

  def new
    @user = current_user
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    @item.location = current_user.location
    authorize @item
    raise
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @booking = Booking.new
    @user = User.find(@item.user_id)
    authorize @item
    @items = Item.near([@item.latitude, @item.longitude], 50)
    @markers = @item && @items.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude,
        info_window: render_to_string(partial: "info_window", locals: { item: item })
      }
    end
  end
  # We have routes for new & create but not part of the initial core journey
  # Need to add strong params for create

  private

  def item_params
    params.require(:item).permit(:photo, :title, :price_per_day, :condition, :size, :category, :description, user_attributes: [:location])
  end
end
