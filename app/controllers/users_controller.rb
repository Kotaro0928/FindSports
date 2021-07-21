class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @recruits = @user.recruitments.order("id DESC").page(params[:page]).per(10)
    @blogs = @user.blogs.order("id DESC").page(params[:page]).per(10)

    # フォロー
    @followings = @user.followings.page(params[:page]).per(10)
    # フォロワー
    @followers = @user.followers.page(params[:page]).per(10)

    # DM機能
    @exist_room = true
    if Room.where(user1_id: current_user.id, user2_id: @user.id).exists?
      @room = Room.where(user1_id: current_user.id, user2_id: @user.id)
    elsif Room.where(user1_id: @user.id, user2_id: current_user.id).exists?
      @room = Room.where(user1_id: @user.id, user2_id: current_user.id)
    else
      @room = Room.new
      @exist_room = false
    end
    @rooms = Room.where(user1_id: current_user.id) and Room.where(user2_id: current_user.id)
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
