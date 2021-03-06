class SellersController < ApplicationController
  def show
    @seller = current_user.seller
    @auctions = Auction.all
    authorize @seller
    @auctions_open = @auctions.order(id: :desc)
                              .select { |auct| auct.deadline > Time.now }
                              .select { |auct| auct.bids.where(seller: @seller).count.zero? }
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

  def edit
    @seller = Seller.find(params[:id])
    authorize @seller
  end

  def update
    @seller = Seller.find(params[:id])
    if @seller.update(seller_params)
      redirect_to @seller, notice: 'seller was successfully updated.'
    else
      render :edit
    end
    authorize @seller
  end

  private

  def seller_params
    params.require(:seller).permit(:name, :address, :photo)
  end
end
