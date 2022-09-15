class CommentsController < ApplicationController

    # http_basic_authenticate_with name:"root",password:"root",only: :destroy
    before_action :authenticate_user!
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_param)
        # @comment.user_id = current_user.id
        redirect_to article_path(@article)
    end

    def edit
        @article = Article.find(params[:article_id])
        # @article.user_id = user_id
        @comment = @article.comments.find(params[:id])
        # @article.
        # @article.comments.update(comment_param)
        # redirect_to article_path(@article)

        # else
        #   render :edit, status: :unprocessable_entity
        # end
     end

    def update
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])  
        if @comment.update(comment_param)
            redirect_to article_path(@article)
        else
          render :edit, status: :unprocessable_entity
        end
    end


    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article), status: 303
    end

    private
    def comment_param
        params.require(:comment).permit(:commenter, :body, :status, :user_id)
    end
end
