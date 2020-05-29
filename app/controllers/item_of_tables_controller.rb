class ItemOfTablesController < ApplicationController
  def index
    @item_of_tables = ItemOfTable.all
    
    respond_to do |format|
      format.html
      format.json { render json: { item_of_tables: @item_of_tables }}
    end
  end
end
