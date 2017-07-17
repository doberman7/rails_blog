class ArticlesController < ApplicationController
  def new
  end

  def create
    # obtner hash con los parametro de l x a forma en la vista new.html.erb
    render plain: params[:article].inspect
  end
end
