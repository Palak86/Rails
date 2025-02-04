class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_buyer!, only: [:add_to_cart]

  # GET /products or /products.json
  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @products = @category.products
    elsif params[:search].present?
      @products = Product.where('name LIKE ?', "%#{params[:search]}%")
                         .or(Product.where('description LIKE ?', "%#{params[:search]}%"))
                         
    else
      @products = Product.all
    end
    @categories = Category.all 

    if params[:search].present?
      @products = Product.where('name LIKE ?', "%#{params[:search]}%")
                         .or(Product.where('description LIKE ?', "%#{params[:search]}%"))
                         
    end
  end

  # GET /products/1 or /products/1.json
  def show
  end
  def add_to_cart
    product = Product.find(params[:id])
    cart = current_buyer.cart || current_buyer.create_cart

    # Check if the product already exists in the cart
    cart_item = cart.cart_items.find_by(product: product)
    if cart_item
      cart_item.increment!(:quantity)
    else
      cart.cart_items.create(product: product, quantity: 1)
    end
    flash[:notice] = "Product added to cart"
  redirect_to cart_path
  end

  # GET /products/new
  def new
    @product = Product.new
    @categories =Category.all
  end

  # GET /products/1/edit
  def edit
    @categories = Category.all
  end

  # POST /products or /products.json
  def create
    @category= Category.find(params[:product][:category_id])
    
    @product = @category.products.create(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_path, status: :see_other, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :image)
    end
end
