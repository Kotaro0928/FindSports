class BlogCommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @blog_comment = current_user.blog_comments.new(blog_comment_params)
    @blog_comment.blog_id = @blog.id
    unless @blog_comment.save
      flash[:danger] = "コメントを入力してください。"
      render template: "blogs/show"
    end
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    @blog_comment = @blog.blog_comments.find_by(blog_id: @blog.id)
    @blog_comment.destroy
    # BlogComment.find_by(id: params[:id], blog_id: params[:blog_id]).destroy
  end

  private

  def blog_comment_params
    params.require(:blog_comment).permit(:comment)
  end
end
