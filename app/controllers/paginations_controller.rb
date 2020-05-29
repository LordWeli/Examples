class PaginationsController < ApplicationController
  def index
    @items = ItemOfTable.page(params[:page]).per(10)
  end
end
