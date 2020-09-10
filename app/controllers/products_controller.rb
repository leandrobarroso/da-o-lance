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

  def edit
    @product = Product.find(params[:id])
    authorize @product
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to user_root_url, notice: 'product was successfully updated.'
    else
      render :edit
    end
    authorize @product
  end

  private

  def product_params
    params.require(:product).permit(:description, :category, :photo)
  end
end
