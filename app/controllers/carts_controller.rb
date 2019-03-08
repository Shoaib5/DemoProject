class CartsController < ApplicationController

	def add_to_cart
		@product= Product.find(params[:product_id])
		@cart=@product.cart.create(cart_params)
	end
	private
	def cart_params
		params.permit(:quantity,:product_id,:user_id)
	end

end
