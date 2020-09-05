class SellersController < ApplicationController
  def show
    if current_user.seller
      @seller = current_user.seller
      @auctions = Auction.all
    else
      redirect_to auctions_path
    end
  end

  def new
    @seller = Seller.new
  end

  def create
    @user = current_user
    @seller = Seller.new(seller_params)
    @seller.user = @user

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
