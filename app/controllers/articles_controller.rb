class ArticlesController < ApplicationController

  # http://localhost:3000/articles
  def index
    @articles = Article.all
  end



  # http://localhost:3000/articles/2
  def show
    # We also use an instance variable (prefixed with @) to hold a reference to the article object.
    #  We do this because Rails will pass all instance variables to the view.
    @article = Article.find(params[:id])
  end

  # http://localhost:3000/articles/new
  def new
    @article = Article.new
  end

  # http://localhost:3000/articles/1/edit
  def edit
    # passed object to form to show old data
    @article = Article.find(params[:id])
  end

  # def create
  #   # render plain: params[:article].inspect
  #   @article = Article.new(params[:article])
  #   @article.save
  #   redirect_to @article
  # end

  # form will post data to this action
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article  #  redirect to the show method
    else
      render 'new'
    end
  end


  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end


  private
    # this method is used to get Posted parameters of form
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
