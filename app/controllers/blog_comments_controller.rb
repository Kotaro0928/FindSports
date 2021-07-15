class BlogCommentsController < ApplicationController
  def create
    blog = Blog.find(params[:blog_id])
    comment = current_user.blog_comments.new(blog_comment_params)
    comment.blog_id = blog.id
    if comment.save
      redirect_to blog_path(blog)
    else
      unless comment.valid?
        flash[:danger] = "コメントを入力してください。"
        redirect_to blog_path(blog)
      end
    end
  end

  def destroy
    BlogComment.find_by(id: params[:id], blog_id: params[:blog_id]).destroy
    redirect_to blog_path(params[:blog_id])
  end

  private

  def blog_comment_params
    params.require(:blog_comment).permit(:comment)
  end
end
