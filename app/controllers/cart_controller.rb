class CartController < ApplicationController

  def index
  @hash_session = session[:shopping_cart]
    @subtotal = 0
    @province = Province.find(current_user.province_id)
    @total =  @province.GST + @province.PST + @province.HST
  end

  def create
    logger.debug("Adding #{params[:id]} to cart")
    quantity = params[:quantity]
    id = params[:id]
    session[:shopping_cart][id.to_sym]  # puts onto the array on the end
    session[:shopping_cart][id.to_sym] = quantity
    product = Item.find(id)
    flash[:notice] = "➕ #{product.name} added to cart!"
    redirect_to root_path
  end

  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id.to_s)
    product = Item.find(id)
    flash[:notice] = "➖ #{product.name} removed from cart!"
    redirect_to cart_index_path
  end
end
