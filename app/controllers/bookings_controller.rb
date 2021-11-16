class BookingsController < ApplicationController
  def create
    # need to display a form on the item show that leads to booking create
    # item_id probably don't need to pass?
    @item = Item.find(params[:item_id])
    @user = User.find(params[:user_id])
    @booking = Booking.new(booking_params)
    @booking.user = @user
    if @booking.save
      redirect_to item_path(@item)
    else
      redem 'items/show.html.erb'
    end
  end

  private

  def booking_params
    require.params[:booking].permit[:item_id, :user_id]
  end
end
