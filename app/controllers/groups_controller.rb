class GroupsController < ApplicationController
  before_action :set_user, only: [:index, :create]
  before_action :set_group, only: [:show, :update, :destroy]

  # GET /users/:user_id/groups
  def index
    render json: @user.groups
  end

  # GET /groups/:id
  def show
    render json: @group
  end

  # POST /users/:user_id/groups
  def create
    @group = @user.groups.build(group_params)
    if @group.save
      render json: @group, status: :created
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groups/:id
  def update
    if @group.update(group_params)
      render json: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /groups/:id
  def destroy
    @group.destroy
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :grade, :school_year)
  end
end
