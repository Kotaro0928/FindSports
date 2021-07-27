class RecruitmentsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @recruits = Recruitment.all.order("id DESC").page(params[:page]).per(10)
  end

  def show
    @recruit = Recruitment.find(params[:id])

    # DM機能(チャットルームが存在するか判断し、無かったら作成する)
    if user_signed_in?
      @exist_room = true
      if Room.where(user1_id: current_user.id, user2_id: @recruit.user_id).exists?
        @room = Room.where(user1_id: current_user.id, user2_id: @recruit.user_id)
      elsif Room.where(user1_id: @recruit.user_id, user2_id: current_user.id).exists?
        @room = Room.where(user1_id: @recruit.user_id, user2_id: current_user.id)
      else
        @room = Room.new
        @exist_room = false
      end
    end
  end

  def new
    @recruit = Recruitment.new
  end

  def create
    recruit = Recruitment.new(recruitment_params)
    recruit.user_id = current_user.id
    if recruit.save
      flash[:success] = "新規募集を投稿しました。"
      redirect_to recruitments_path
    else
      unless recruit.valid?
        flash[:danger] = "募集内容を正しく入力してください。"
        redirect_to new_recruitment_path
      end
    end
  end

  def edit
    @recruit = Recruitment.find(params[:id])
  end

  def update
    recruit = Recruitment.find(params[:id])
    if recruit.update(recruitment_params)
      flash[:success] = "募集を更新しました。"
      redirect_to recruitment_path(recruit)
    else
      unless recruit.valid?
        flash[:danger] = "募集内容を正しく入力してください。"
        redirect_to edit_recruitment_path(recruit)
      end
    end
  end

  def destroy
    recruit = Recruitment.find(params[:id])
    recruit.destroy
    redirect_to recruitments_path
  end

  private

  def recruitment_params
    params.require(:recruitment).permit(:sport, :title, :event_date, :due_date, :prefecture, :place, :recruit_number, :level, :body)
  end

  def ensure_correct_user
    @recruit = Recruitment.find(params[:id])
    unless @recruit.user == current_user
      redirect_to recruitments_path
    end
  end
end
