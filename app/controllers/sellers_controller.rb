class SellersController < ApplicationController
  def show
    @seller = Seller.find(params[:id])
    @auctions = Auction.all
  end

  def new
    @seller = Seller.new
  end

  def create
    @user = current_user
    @seller = Seller.new(seller_params)
    @seller.user = @user

    if @seller.save
      redirect_to seller_path(@seller.id), notice: 'Your seller profile has been created!'
    else
      render :new
    end
  end

  private

  def seller_params
    params.require(:seller).permit(:name, :address, :photo)
  end
end
