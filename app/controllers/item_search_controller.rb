class ItemSearchController < ApplicationController
  def index

    if params[:search].blank? && params[:category].blank? # Search and category blank

      redirect_to("/categories", alert: 'Emplty filed!') and return



    elsif params[:search].blank? && !params[:category].blank? # Search is blank

      wildcard_search = "%#{params[:category]}%"
      @result_set = Category.where("name LIKE ?", wildcard_search)

      # parameter = params[:category]

      # car = Category.find(parameter).items

      # @result_set = car

    elsif !params[:search].blank? && params[:category].blank? # category is blank

      wildcard_search = "%#{params[:search]}%"
      @result_set = Item.where("name LIKE ?", wildcard_search)

      # parameter = params[:search].downcase

      # @result_set = Item.all.where('lower(model) like ?', "%#{parameter}%")

    else
     

      parameter = params[:search].downcase

      abc = params[:category]

      car = Item.includes(:category).all.where(category: abc)

      @result_set = car.where('name like ?', "%#{parameter}%")

    end

  end
end
