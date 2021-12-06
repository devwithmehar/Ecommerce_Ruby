class ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:store && :category).order("name").page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @items = Item.where("name LIKE ?", wildcard_search)
  end

end
