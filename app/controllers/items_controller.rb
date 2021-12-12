class ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:store && :category).order("name").page(params[:page])
    @qty = 1
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
    redirect_to action: :index
  end

end
