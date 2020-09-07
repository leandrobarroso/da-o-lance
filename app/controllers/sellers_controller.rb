class SellersController < ApplicationController
  def show
    @seller = current_user.seller
    @auctions = Auction.all
    authorize @seller
  end

  def new
    if current_user.seller
      redirect_to seller_path(current_user.seller)
    else
    @seller = Seller.new
    end
    authorize @seller
  end

  def create
    @user = current_user
    @seller = Seller.new(seller_params)
    @seller.user = @user
    authorize @seller
    if @seller.save
      redirect_to user_root_path, notice: 'Your seller profile has been created!'
    else
      render :new
    end
  end

  private

  def seller_params
    params.require(:seller).permit(:name, :address, :photo)
  end
end
