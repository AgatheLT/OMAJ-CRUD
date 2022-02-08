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

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to category_url(@category), notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
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
