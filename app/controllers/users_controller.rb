class UsersController < ApplicationController
  def show
    @user = current_user
    @seller = @user.seller
    if @seller
      redirect_to seller_path(@seller)
    else
      redirect_to auctions_path
    end
    authorize @user
  end
end
