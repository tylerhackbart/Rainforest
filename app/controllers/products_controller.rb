class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])

    if current_user
      @review = @product.reviews.build
    end
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_url
    else
      render :new
    end
  end

  def destory
    @product = Product.find(params[:id])
    @product.destory
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents)
  end
end
