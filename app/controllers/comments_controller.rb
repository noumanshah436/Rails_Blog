class CommentsController < ApplicationController
  http_basic_authenticate_with name: "nouman", password: "nouman", only: :destroy

  def create
    print "parameters ="
    p params
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    # redirect_to article_path(@article)

    respond_to do |format|
      format.html{redirect_to article_path(@article)}
      format.js
    end
    # respond_to is more like an if-then-else statement than a series of sequential lines.
    # When there is an Ajax request(i.e, when remote: true is set) then format.js will be executed otherwise format.html will be executed.
    # When format.js will be executed, rails automatically calls a Javascript embedded ruby(.js.erb) file with the same name as the action name.
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
