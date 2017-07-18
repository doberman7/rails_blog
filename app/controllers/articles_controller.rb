class ArticlesController < ApplicationController
  #mostrar todos los articulos
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  #metodo para ver articulos
  def show
    @article = Article.find(params[:id])
  end

  def create
    #we need to change the create action to use the new Article model to save the data in the database
    #every Rails model can be initialized with its respective attributes, which are automatically mapped to the respective database columns
    @article = Article.new(article_params) #=> necesario  permitir los parametro, solucionado con el metodo article_params

    if @article.save
      redirect_to @article
    else
      # Notice that inside the create action we use render instead of redirect_to when save returns false. The render method is used so that the @article object is passed back to the new template when it is rendered. This rendering is done within the same request as the form submission, whereas the redirect_to will tell the browser to issue another request
      render 'new'
    end

    # obtner hash con los parametro de l x a forma en la vista new.html.erb
    #render plain: params[:article].inspect
  end

  def update

  @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

# The destroy method is generally the last CRUD action in the controller, and like the other public CRUD actions, it must be placed before any private or protected methods
def destroy
  @article = Article.find(params[:id])
  @article.destroy

  redirect_to articles_path
end

  private
  ##We have to whitelist our controller parameters to prevent wrongful mass assignment. In this case, we want to both allow and require the title and text parameters for valid use of create
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
