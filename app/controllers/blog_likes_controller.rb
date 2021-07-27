class BlogLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @blog = Blog.find(params[:blog_id])
    like = current_user.blog_likes.new(blog_id: @blog.id)
    like.save
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    like = current_user.blog_likes.find_by(blog_id: @blog.id)
    like.destroy
  end
end
