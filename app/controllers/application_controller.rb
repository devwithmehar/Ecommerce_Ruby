class ApplicationController < ActionController::Base
  before_action :authenticate_user! , :initialize_session
  helper_method :cart

  def initialize_session
    session[:shopping_cart] ||= {} # empty has for to cart
    session[:item_quantity] ||= {} # item_id quantity relation for decrement and increment of items



    items = Item.all
    items.each do |item|
      session[:item_quantity][item.id.to_i]
      if(params[:quantity] == nil)
        session[:item_quantity][item.id.to_i] = 1
      end
      if(params[:quantity] != nil)
        session[:item_quantity][item.id.to_i] = params[:quantity]
      end

    end

  end

  def cart
  end
end
