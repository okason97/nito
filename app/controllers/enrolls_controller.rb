class EnrollsController < ApplicationController
  before_action :set_enroll, only: [:show, :edit, :update, :destroy]

  # GET /enrolls
  # GET /enrolls.json
  def index
    @course = params[:course_id]
    @students = Student.left_join_enrolls @course
    puts @students.as_json
  end

  # GET /enrolls/1
  # GET /enrolls/1.json
  def show
  end

  # GET /enrolls/new
  def new
    @enroll = Enroll.new
  end

  # GET /enrolls/1/edit
  def edit
  end

  # POST /course/:course_id/enrolls
  # POST /enrolls.json
  def create
    course = Course.find(params[:course_id])
    student = Student.find_by(dni: params[:student_id])
    @enroll = Enroll.new( student: student, course: course)
    TestCourse.of(course).each do |tc|
      Score.create( student: student, test_id: tc.test_id, value: -2)
    end
    
    respond_to do |format|
      if @enroll.save
        format.html { redirect_to course_enrolls_path(course), notice: 'Enroll was successfully created.' }
        format.json { render :show, status: :created, location: course_enrolls_path(course) }
      else
        format.html { render :new }
        format.json { render json: @enroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrolls/1
  # PATCH/PUT /enrolls/1.json
  def update
    respond_to do |format|
      if @enroll.update(enroll_params)
        format.html { redirect_to @enroll, notice: 'Enroll was successfully updated.' }
        format.json { render :show, status: :ok, location: @enroll }
      else
        format.html { render :edit }
        format.json { render json: @enroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrolls/1
  # DELETE /enrolls/1.json
  def destroy
    course = Course.find(params[:course_id])
    TestCourse.of(course).each do |tc|
      Score.where( student_id: @enroll.student_id, test_id: tc.test_id).each do |score|
        score.destroy
      end
    end
    @enroll.destroy
    respond_to do |format|
      format.html { redirect_to course_enrolls_path(course), notice: 'Enroll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enroll
      @enroll = Enroll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enroll_params
      params.fetch(:enroll, {})
    end
end
