class BlogsController < ApplicationController
	http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  def index
     @blogs = Blog1.all
  end

  def show
    @blog = Blog1.find(params[:id])
  end

  def new
    @blog = Blog1.new
  end
  def edit
  @blog = Blog1.find(params[:id])
end
  def create
  @blog = Blog1.new(blog_params)
   if @blog.save
    redirect_to blogs_path
  else
    render 'new'
  end
  end
 def update
  @blog = Blog1.find(params[:id])
 
  if @blog.update(blog_params)
    redirect_to @blog
  else
    render 'edit'
  end
end
def destroy
  @blog= Blog1.find(params[:id])
  @blog.destroy
 
  redirect_to blogs_path
end
private
 def blog_params
    params.require(:blog).permit(:title, :description)
  end
end
