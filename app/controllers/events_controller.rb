class EventsController < ApplicationController
  before_action :require_login, only: [:new, :create]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def upcoming
    @upcoming_events = Event.upcoming.includes(:user, :category)
    @users = User.all
  end

  def past
    @pasts_events = Event.past
  end

  def new
    @event = current_user.events.build
    @event.build_category
    @categories = Category.all
  end

  def create
    if event_params[:category_id].present?
      @event = current_user.events.build(event_params.except(:category_attributes))
    else
      @event = current_user.events.build(event_params)
    end    
    if @event.save
      flash[:success] = "イベントを作成しました。"
      redirect_to root_path
    else
      flash.now[:danger] = "イベントを作成できませんでした。"
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    @event.build_category
    @categories = Category.all
  end

  def update
    if @event.update(event_params)
      flash[:success] = "イベント情報を更新しました。"
      redirect_to root_path
    else
      flash.now[:danger] = "イベント情報を更新できませんでした。"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    flash[:success] = "イベントを削除しました。"
    redirect_to root_path, status: :see_other
  end

  private

    def event_params
      params.require(:event).permit(:title, :description, :start_time,
                                    :location, :category_id, category_attributes: [:name])
    end

    def set_event
      @event = Event.find(params[:id])
    end
end
