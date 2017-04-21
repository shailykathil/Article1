class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  def index
     if params[:search].present?
        @articles = Article.where('title LIKE ? OR text LIKE ?', "%#{params[:search]}%",
        "%#{params[:search]}%")
      elsif params[:start_date].present? && params[:end_date].present?
      @articles = Article.where('created_at >= ? AND created_at <=?',
      params[:start_date].to_date, params[:end_date].to_date) 
      else 
        @articles = Article.all 
     end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end
  def edit
  @article = Article.find(params[:id])
end

  def create
   @article = Article.new(article_params)
   if @article.save
   params[:article][:image].each do |image|
   Image.create(:image=> image, article_id: @article.id)
   end
    redirect_to @article
  else
    render 'new'
  end
  end

  def ar
  end

 def update
  @article = Article.find(params[:id])
 
   if @article.update(article_params)
     # images = Image.where(:article_id=>@article.id)
     images = @article.images
       if params[:article][:image].present?
       images.destroy_all
       params[:article][:image].each do |image|
       Image.create(:image=> image, article_id: @article.id)
   end
 end
    redirect_to @article
  else
    render 'edit'
  end
end
def destroy
  @article = Article.find(params[:id])
  @article.destroy
 
  redirect_to articles_path
end
private
 def article_params
    params.require(:article).permit(:title, :text, :image, :video, :category_id)
  end
end