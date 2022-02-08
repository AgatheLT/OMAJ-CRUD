class ProductsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @category = Category.find(params[:category_id])
    @product.category = @category
    if  @product.save
      redirect_to category_path(@category)
    else 
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to category_path(@product.category)
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :brand, :color, :price)
  end

end
