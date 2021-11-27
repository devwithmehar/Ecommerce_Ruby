class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:store).all.order("name")
  end

  def show
    @category = Category.find(params[:id])
    @items = Item.where(category_id: @category)
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @categories = Category.where("name LIKE ?", wildcard_search)
  end

end
