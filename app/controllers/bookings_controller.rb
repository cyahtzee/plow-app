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
      @booking.update! status: 2
      redirect_to items_path
    else
      render 'items/show.html.erb'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:item_id, :user_id, :start_date, :end_date)
  end
end
