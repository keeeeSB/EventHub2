class JoinsController < ApplicationController
  before_action :require_login

  def index
    @join_events = current_user.joins.includes(:event).order('events.start_time ASC').map(&:event)
  end

  def create
    join = current_user.joins.build(event_id: params[:event_id])
    join.save
    flash[:success] = "参加申し込みが完了しました。"
    redirect_to root_path
  end

  def destroy
    join = current_user.joins.find(params[:id])
    join.destroy
    flash[:success] = "参加申し込みを取り消しました。"
    redirect_to root_path, status: :see_other
  end
end
