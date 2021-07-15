class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @recruits = @user.recruitments
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:success] = "プロフィールを更新しました。"
      redirect_to user_path(user)
    else
      unless user.valid?
        flash[:danger] = "プロフィール内容を正しく入力してください。"
        redirect_to edit_user_path(user)
      end
    end
  end

  def withdrawal
  end

   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :status)
  end
end
