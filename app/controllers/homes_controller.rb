class HomesController < ApplicationController
  def top
    @recruits = Recruitment.order("id DESC").limit(3)
    @blogs = Blog.order("id DESC").limit(3)
  end
end
