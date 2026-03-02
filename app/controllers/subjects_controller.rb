class SubjectsController < ApplicationController
  before_action :set_group, only: [:index, :create]
  before_action :set_subject, only: [:show, :update, :destroy]

  # GET /groups/:group_id/subjects
  def index
    render json: @group.subjects
  end

  # GET /subjects/:id
  def show
    render json: @subject
  end

  # POST /groups/:group_id/subjects
  def create
    @subject = @group.subjects.build(subject_params)
    if @subject.save
      render json: @subject, status: :created
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subjects/:id
  def update
    if @subject.update(subject_params)
      render json: @subject
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subjects/:id
  def destroy
    @subject.destroy
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name, :grade)
  end
end
