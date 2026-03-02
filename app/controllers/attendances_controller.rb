class AttendancesController < ApplicationController
  before_action :set_group, only: [:index, :create]
  before_action :set_attendance, only: [:show, :update, :destroy]

  # GET /groups/:group_id/attendances
  def index
    render json: @group.attendances, include: :attendance_records
  end

  # GET /attendances/:id
  def show
    render json: @attendance, include: :attendance_records
  end

  # POST /groups/:group_id/attendances
  def create
    @attendance = @group.attendances.build(attendance_params)
    if @attendance.save
      # If attendance_records are passed in params, create them
      if params[:attendance_records]
        params[:attendance_records].each do |record|
          @attendance.attendance_records.create(record.permit(:student_id, :status, :is_justified))
        end
      end
      render json: @attendance, include: :attendance_records, status: :created
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /attendances/:id
  def update
    if @attendance.update(attendance_params)
      render json: @attendance, include: :attendance_records
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /attendances/:id
  def destroy
    @attendance.destroy
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  def attendance_params
    params.require(:attendance).permit(:date, :time)
  end
end
