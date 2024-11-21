class SessionsController < ApplicationController

  def new
  end

  def create
    user = login(params[:session][:email], params[:session][:password])
    if user
      flash[:success] = "ログインしました。"
      redirect_to user
    else
      flash.now[:danger] = "ログインできませんでした。"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    flash[:success] = "ログアウトしました。"
    redirect_to root_path, status: :see_other
  end
end
