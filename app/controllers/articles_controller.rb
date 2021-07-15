class ArticlesController < ApplicationController
  #http_basic_authenticate_with name: "Serlle", password: "123", except: [:index, :show]
  prepend_after_action :authenticate_user!

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    #@comment = @article.comments.build
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

      if @article.save
        redirect_to @article
      else
        render :new
      end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

      if @article.update(article_params)
        redirect_to @article
      else
        render :edit
      end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to '/articles'
  end

private
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end

end
