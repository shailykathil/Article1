class Comment1Controller < ApplicationController
	 def create
    @blog = Blog1.find(params[:blog_id])
    @comment1 = @blog.comment1.create(comment1_params)
    redirect_to blog_path(@blog)
  end
 
  private
    def comment1_params
      params.require(:comment1).permit(:commenter, :body)
    end
end
