class FabricToCartsController < ApplicationController
	def show_user_cart
		cart = policy_scope(FabricToCart)
		@cart = cart_by_supplier(cart)
	end

	private

	def cart_by_supplier(cart)
  	cart_by_supplier = {}
  	cart.each do |order_item|
  		if cart_by_supplier[order_item.company].nil?
  			cart_by_supplier[order_item.company] = [order_item]
  		else
  			cart_by_supplier[order_item.company] << order_item
  		end
  	end
  	return cart_by_supplier
  end
end
