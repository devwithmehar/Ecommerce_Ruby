class ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:store && :category).order("name").page(params[:page])
    @hash_item_quantity_relation = session[:item_quantity]
  end

  def show
    @item = Item.find(params[:id])
    @qty = 1
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @items = Item.where("name LIKE ?", wildcard_search)
  end

  def create
    default_value = 1
    quantity = params[:quantity]
    id = params[:id].to_i
    increment = 1 + session[:item_quantity][id].to_i
    session[:item_quantity][id] = increment.to_s



    redirect_to action: :index
  end

end
