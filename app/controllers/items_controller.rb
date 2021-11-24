class ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:store && :category).order("name")
  end

  def show
    @item = Item.find(params[:id])
  end
end
