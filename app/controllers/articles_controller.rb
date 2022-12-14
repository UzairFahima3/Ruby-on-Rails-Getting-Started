class ArticlesController < ApplicationController
  expose :articles, ->{ Article.all }
  expose :article
  # expose :thing, find_by: :article
  # http_basic_authenticate_with name:"root", password:"root", except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]

  # def index

  #   @articles = Article.all

  # end

  def show
    # @article = Article.find(params[:id])
  end

  def new
  #   @article = Article.new
  end

  def create 
    # @article = Article.new(article_params)
  
    if article.save
      redirect_to article
    
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    # @article = Article.find(params[:id])
    # @article.user_id = user_id

    if article.update(article_params)
      redirect_to article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    # @article = Article.find(params[:id])

  end

  def destroy
    # @article = Article.find(params[:id])
    article.destroy

    redirect_to root_path, status: :see_other
  end

  private

    def article_params
      params.require(:article).permit(:title, :body, :status, :user_id, :image)
    end

end

  


