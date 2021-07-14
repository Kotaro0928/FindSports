class BlogsController < ApplicationController
  def index
    @blogs = Blog.all.order("id DESC").page(params[:page]).per(10)
  end

  def show
    @blog = Blog.find(params[:id])
    @blog_comment = BlogComment.new
  end

  def new
    @blog = Blog.new
  end

  def create
    blog = Blog.new(blog_params)
    blog.user_id = current_user.id
    if blog.save
      flash[:success] = "新規ブログを投稿しました。"
      redirect_to blogs_path
    else
      unless blog.valid?
        flash[:danger] = "ブログ内容を正しく入力してください。"
        redirect_to new_blogs_path
      end
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    if blog.update(blog_params)
      flash[:success] = "ブログを更新しました。"
      redirect_to blogs_path
    else
      unless blog.valid?
        flash[:danger] = "ブログ内容を正しく入力してください。"
        redirect_to edit_blog_path(blog)
      end
    end
  end

  def destroy
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :sport, :body)
  end
end
