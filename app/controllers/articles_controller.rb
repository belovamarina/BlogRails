class ArticlesController < ApplicationController

  #http_basic_authenticate_with name: "admin", password: "secret", except: [:index, :show]
  before_filter :authenticate_user!, :except => [:show, :index]
  
  def index
    @articles = Article.all.order('created_at desc')
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.valid?
      @article.save

      redirect_to @article
    else
      render action: 'new'
    end
    
  end

  def edit
   @article = Article.find(params[:id])
   authorize! :show, @article
  end

  def update
    @article = Article.find(params[:id])
    authorize! :update, @article

    if @article.update(article_params)
      redirect_to @article
    else
      render action: 'edit'
    end

  end

  def destroy
    @article = Article.find(params[:id])
    authorize! :delete, @article
    
    @article.destroy
 
    redirect_to articles_path

  end


  private

  def article_params
    params.require(:article).permit(:title, :text, :user_id, :author)
  end

end
