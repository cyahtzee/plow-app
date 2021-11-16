class BookingsController < ApplicationController
  def create
    # need to display a form on the item show that leads to booking create
    raise
    # item_id probably don't need to pass?
    @user = User.find(params[:user_id])
    @booking = Booking.new(booking_params)
    @booking.user = @user
  end

  private

  def booking_params
    require.params[:booking].permit[:item_id, :user_id]
  end
end
