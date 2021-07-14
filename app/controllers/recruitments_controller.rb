class RecruitmentsController < ApplicationController
  def index
    @recruits = Recruitment.all.order("id DESC").page(params[:page]).per(10)
  end

  def show
    @recruit = Recruitment.find(params[:id])
    @recruit_comment = RecruitComment.new
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
      redirect_to recruitments_path
    else
      unless recruit.valid?
        flash[:danger] = "募集内容を正しく入力してください。"
        redirect_to edit_recruitment_path(recruit)
      end
    end
  end

  def destroy
  end

  private

  def recruitment_params
    params.require(:recruitment).permit(:sport, :title, :event_date, :due_date, :prefecture, :place, :recruit_number, :level, :body)
  end
end
