class Owner::ItemsController < ApplicationController
  def index
    @user = User.new
    @item = Item.new
    @owner = policy_scope(User)
    authorize :owner, :index?
  end
end
