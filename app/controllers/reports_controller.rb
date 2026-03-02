class ReportsController < ApplicationController
  before_action :set_student, only: [:create]
  before_action :set_report, only: [:show, :update, :destroy]

  # GET /students/:student_id/reports
  # GET /groups/:group_id/reports
  def index
    if params[:group_id]
      @group = Group.find(params[:group_id])
      @reports = Report.where(student_id: @group.students.pluck(:id))
    else
      @student = Student.find(params[:student_id])
      @reports = @student.reports
    end
    render json: @reports
  end

  # GET /reports/:id
  def show
    render json: @report
  end

  # POST /students/:student_id/reports
  def create
    @report = @student.reports.build(report_params)
    if @report.save
      render json: @report, status: :created
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reports/:id
  def update
    if @report.update(report_params)
      render json: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reports/:id
  def destroy
    @report.destroy
  end

  private

  def set_student
    @student = Student.find(params[:student_id])
  end

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :description, :date, :student_id)
  end
end
