class SearchsController < ApplicationController
  def search
    @model = params["model"]
    @content = params["content"]
    @records = search_for(@model, @content)
  end

  private

  def search_for(model, content)
    if model == 'user'
      User.where('name LIKE ?', '%'+content+'%')
    elsif model == 'recruit'
      Recruitment.where(['title LIKE  ?', '%'+content+'%' ])
    elsif model == 'blog'
      Blog.where('title LIKE ?', '%'+content+'%')
    end
  end
end

