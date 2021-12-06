class CartController < ApplicationController

  def index
    @items =  Item.find(session[:shopping_cart] )
    @total = 0
  end

  def create
    logger.debug("Adding #{params[:id]} to cart")

    id = params[:id].to_i
    session[:shopping_cart] << id # puts onto the array on the end
    product = Item.find(id)
    flash[:notice] = "➕ #{product.name} added to cart!"
    redirect_to root_path
  end

  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    product = Item.find(id)
    flash[:notice] = "➖ #{product.name} removed from cart!"
    redirect_to cart_index_path
  end
end
