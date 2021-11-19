class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def create
    @item = Item.find(params[:item_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.item_id = params[:item_id]
    authorize @booking
    if @booking.save
      # Commenting out for modal to works, otherwise it overlaps.
      # redirect_to items_path
    else
      render "items/show.html.erb"
    end
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @owner = User.find(@booking.item.user_id)
    if @owner == current_user
      @booking.update(booking_params)
      redirect_to :bookings
    else
      raise StandardError::NotAuthorized
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:item_id, :user_id, :start_date, :end_date, :status)
  end
end
