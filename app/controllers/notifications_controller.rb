class NotificationsController < ApplicationController
  before_action :set_user, only: [:index, :create]
  before_action :set_notification, only: [:show, :update, :destroy]

  # GET /users/:user_id/notifications
  def index
    render json: @user.notifications
  end

  # GET /notifications/:id
  def show
    render json: @notification
  end

  # POST /users/:user_id/notifications
  def create
    @notification = @user.notifications.build(notification_params)
    if @notification.save
      render json: @notification, status: :created
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notifications/:id
  def update
    if @notification.update(notification_params)
      render json: @notification
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notifications/:id
  def destroy
    @notification.destroy
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_notification
    @notification = Notification.find(params[:id])
  end

  def notification_params
    params.require(:notification).permit(:title, :description, :creation_date, :expiration_date)
  end
end
