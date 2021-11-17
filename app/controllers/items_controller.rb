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

  def show
    @item = Item.find(params[:id])
    @booking = Booking.new
    @user = User.find(@item.user_id)
    authorize @item
    index # Allow map to get data attributes from all Items for markers.
  end
  # We have routes for new & create but not part of the initial core journey
  # Need to add strong params for create
end
