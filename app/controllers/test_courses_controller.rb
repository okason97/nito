class TestCoursesController < ApplicationController
  before_action :set_test_course, only: [:show, :edit, :update, :destroy]

  # GET /test_courses
  # GET /test_courses.json
  def index
    @test_courses = TestCourse.all
  end

  # GET /test_courses/1
  # GET /test_courses/1.json
  def show
  end

  # GET /test_courses/new
  def new
    @test_course = TestCourse.new
  end

  # GET /test_courses/1/edit
  def edit
  end

  # POST /test_courses
  # POST /test_courses.json
  def create
    @test_course = TestCourse.new(test_course_params)

    respond_to do |format|
      if @test_course.save
        format.html { redirect_to @test_course, notice: 'Test course was successfully created.' }
        format.json { render :show, status: :created, location: @test_course }
      else
        format.html { render :new }
        format.json { render json: @test_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_courses/1
  # PATCH/PUT /test_courses/1.json
  def update
    respond_to do |format|
      if @test_course.update(test_course_params)
        format.html { redirect_to @test_course, notice: 'Test course was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_course }
      else
        format.html { render :edit }
        format.json { render json: @test_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_courses/1
  # DELETE /test_courses/1.json
  def destroy
    @test_course.destroy
    respond_to do |format|
      format.html { redirect_to test_courses_url, notice: 'Test course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_course
      @test_course = TestCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_course_params
      params.fetch(:test_course, {})
    end
end
