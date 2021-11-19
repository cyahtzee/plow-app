class Owner::ItemsController < ApplicationController
  def index
    @user = User.new
    @item = Item.new
    @owner = policy_scope(User)
    authorize :owner, :index?
  end

   def create
    @item = Item.new(item_params)
    @item.user = current_user
    @user = current_user
    current_user.update(user_params) unless current_user.location
    authorize @item
    if @item.save
      redirect_to owner_items_path
    else
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:photo, :title, :price_per_day, :condition, :size, :category, :description)
  end

  def user_params
    params.require(:user).permit(:location)
  end
end
