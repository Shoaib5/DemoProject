module ProductsHelper
	 @@cart = Array.new

	def test(p_id)
		@@cart.push(p_id)
	end
	def cart
		puts @@cart[0]
	end

end
