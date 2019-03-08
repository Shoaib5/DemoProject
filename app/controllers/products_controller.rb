class ProductsController < ApplicationController
  before_action :authenticate_user! , except: [:index , :show]
  def index
    @products= Product.all
  end
	def new
		@product = Product.new
	end

	def edit
    @pre = "Update Product"
		@product = Product.find(params[:id])
	end

	def create
		@product = current_user.products.new(product_params)
    puts "$" * 100
    puts @product.inspect
  	if @product.save
			flash[:notice] = "Product added succesfully..!"
  		redirect_to @product
		else
			render 'new'
		end
	end
	def update
	  @product = Product.find(params[:id])

	  if @product.update(product_params)
	    redirect_to @product
	  else
	    render 'edit'
	  end
	end

	def destroy
#    @user = User.find(current_user.id)
	  @product = current_user.products.find_by(params[:id])
	  @product.destroy
	  redirect_to products_path
	end
  def show
    #@user = User.find(current_user.id)
		@product = Product.find(params[:id])
	end
  private
	 def product_params
	  params.require(:product).permit(:name,:price,:quantity,:product_type)
	 end

end
