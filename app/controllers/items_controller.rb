class ItemsController < ApplicationController
  def index
    @items = policy_scope(Item)
    @users = User.all
    filter_dates
    filter_categories
    create_markers
  end

  def new
    @user = User.new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    @user = current_user
    current_user.update(user_params) unless current_user.location
    authorize @item
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @booking = Booking.new
    @user = User.find(@item.user_id)
    authorize @item
    @users = User.near([@item.user.latitude, @item.user.longitude], 50)
    @markers = @user && @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: user })
      }
    end
  end

  private

  def filter_dates
    if params[:start].present? && params[:end].present?
      @id_array = []
      @items.each do |item|
        item.bookings.each do |booking|
          if date_unavailable?(booking) && booking.status == "accepted"
            @id_array << booking.item_id
          end
        end
      end
      @items = Item.where.not(id: @id_array)
    end
  end

  def filter_categories
    if params[:commit].present?
      category = params[:commit]
      @items = Item.where(category: category)
    end
  end

  def date_unavailable?(booking)
    booking_range = booking.start_date..booking.end_date
    query_range = Date.parse(params[:start])..Date.parse(params[:end])
    booking_range.cover?(query_range.begin) && booking_range.cover?(query_range.end)
  end

  def create_markers
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: user })
      }
    end
  end

  def item_params
    params.require(:item).permit(:photo, :title, :price_per_day, :condition, :size, :category, :description)
  end

  def user_params
    params.require(:user).permit(:location)
  end
end
