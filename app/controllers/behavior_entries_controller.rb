class BehaviorEntriesController < ApplicationController
  before_action :set_student, only: [:create]
  before_action :set_behavior_entry, only: [:show, :update, :destroy]

  # GET /students/:student_id/behavior_entries
  # GET /groups/:group_id/behavior_entries
  def index
    if params[:group_id]
      @group = Group.find(params[:group_id])
      @behavior_entries = BehaviorEntry.where(student_id: @group.students.pluck(:id))
    else
      @student = Student.find(params[:student_id])
      @behavior_entries = @student.behavior_entries
    end
    render json: @behavior_entries
  end

  # GET /behavior_entries/:id
  def show
    render json: @behavior_entry
  end

  # POST /students/:student_id/behavior_entries
  def create
    @behavior_entry = @student.behavior_entries.build(behavior_entry_params)
    if @behavior_entry.save
      render json: @behavior_entry, status: :created
    else
      render json: @behavior_entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /behavior_entries/:id
  def update
    if @behavior_entry.update(behavior_entry_params)
      render json: @behavior_entry
    else
      render json: @behavior_entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /behavior_entries/:id
  def destroy
    @behavior_entry.destroy
  end

  private

  def set_student
    @student = Student.find(params[:student_id])
  end

  def set_behavior_entry
    @behavior_entry = BehaviorEntry.find(params[:id])
  end

  def behavior_entry_params
    params.require(:behavior_entry).permit(:behavior_type, :description, :date, :student_id)
  end
end
