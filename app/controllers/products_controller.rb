class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_buyer!, only: [:add_to_cart]
  before_action :set_categories, only: %i[ new index edit]

  def index
    if params[:category_id]
      @products= Product.where(category_id: params[:category_id])
    elsif params[:search].present?
      @products = Product.where('name LIKE ?', "%#{params[:search]}%")
                         .or(Product.where('description LIKE ?', "%#{params[:search]}%"))
    else
      @products = Product.all
    end
  end

  def show
  end

  def add_to_cart
    product = Product.find(params[:id])
    cart = current_buyer.cart || current_buyer.create_cart
  
    cart_item = cart.cart_items.find_by(product: product)
    if cart_item
      cart_item.increment!(:quantity)
    else
      cart.cart_items.create(product: product, quantity: 1)
    end
    flash[:notice] = "Product added to cart"
    redirect_to cart_path
  end
  
  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product is sucessfully created"
      redirect_to @product
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "Product is sucessfully updated"
      redirect_to @product
    else
      render :edit
    end
  end
  

  def destroy
    @product.destroy!
    redirect_to products_path
  end

  private

    def set_categories
      @categories = Category.all
    end

    def set_product
      @product = Product.find(params.expect(:id))
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :image, :stock, :category_id)
    end
end
