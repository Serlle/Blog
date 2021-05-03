class ArticlesController < ApplicationController
  def index_pag_web
    @articles = Article.all
  end
end
