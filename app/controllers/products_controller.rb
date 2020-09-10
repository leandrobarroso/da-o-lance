class ProductsController < ApplicationController
  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    authorize @product
    if @product.save
      redirect_to user_root_path, notice: 'Your product profile has been created!'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:description, :category, :photo)
  end
end
