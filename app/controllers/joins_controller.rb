class JoinsController < ApplicationController
  before_action :require_login

  def create
    @join = current_user.joins.build
    if @join.save
      flash[:success] = "参加申し込みをしました。"
      redirect_to root_path
    else
      flash.now[:danger] = "参加申し込みできませんでした。"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @join = Join.find(params[:id])
    @join.destroy
    flash[:success] = "参加申し込みを取り消しました。"
    redirect_to root_path, status: :see_other
  end
end
