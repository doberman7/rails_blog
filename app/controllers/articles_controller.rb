class ArticlesController < ApplicationController
  #mostrar todos los articulos
  def index
    @articles = Article.all
  end

  def new
  end

  #metodo para ver articulos
  def show
    @article = Article.find(params[:id])
  end

  def create
    #we need to change the create action to use the new Article model to save the data in the database
    #every Rails model can be initialized with its respective attributes, which are automatically mapped to the respective database columns
    @article = Article.new(article_params) #=> necesario  permitir los parametro, solucionado con el metodo article_params

    @article.save
    redirect_to @article

    # obtner hash con los parametro de l x a forma en la vista new.html.erb
    #render plain: params[:article].inspect
  end

  private
  ##We have to whitelist our controller parameters to prevent wrongful mass assignment. In this case, we want to both allow and require the title and text parameters for valid use of create
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
