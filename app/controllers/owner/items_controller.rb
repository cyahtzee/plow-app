class Owner::ItemsController < ApplicationController
  def index
    @owner = policy_scope(User)
    authorize :owner, :index?
  end
end
