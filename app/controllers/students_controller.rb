class StudentsController < ApplicationController
  before_action :set_group, only: [:index, :create]
  before_action :set_student, only: [:show, :update, :destroy]

  # GET /groups/:group_id/students
  def index
    render json: @group.students
  end

  # GET /students/:id
  def show
    render json: @student
  end

  # POST /groups/:group_id/students
  def create
    @student = @group.students.build(student_params)
    if @student.save
      render json: @student, status: :created
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /students/:id
  def update
    if @student.update(student_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /students/:id
  def destroy
    @student.destroy
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:names, :last_names, :age, :sex, :height, :weight, :photo_url)
  end
end
