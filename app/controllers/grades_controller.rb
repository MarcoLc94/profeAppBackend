class GradesController < ApplicationController
  before_action :set_student, only: [:create]
  before_action :set_grade, only: [:show, :update, :destroy]

  # GET /students/:student_id/grades
  # GET /groups/:group_id/grades
  def index
    if params[:group_id]
      @group = Group.find(params[:group_id])
      @grades = Grade.where(student_id: @group.students.pluck(:id))
    else
      @student = Student.find(params[:student_id])
      @grades = @student.grades
    end
    render json: @grades
  end

  # GET /grades/:id
  def show
    render json: @grade
  end

  # POST /students/:student_id/grades
  def create
    @grade = @student.grades.build(grade_params)
    if @grade.save
      render json: @grade, status: :created
    else
      render json: @grade.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /grades/:id
  def update
    if @grade.update(grade_params)
      render json: @grade
    else
      render json: @grade.errors, status: :unprocessable_entity
    end
  end

  # DELETE /grades/:id
  def destroy
    @grade.destroy
  end

  private

  def set_student
    @student = Student.find(params[:student_id])
  end

  def set_grade
    @grade = Grade.find(params[:id])
  end

  def grade_params
    params.require(:grade).permit(:score, :comment, :task_id, :student_id)
  end
end
