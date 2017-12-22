class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  # GET /tests
  # GET /tests.json
  def index
    @course = Course.find(params[:course_id])
    @tests = Test.joins(:test_course).select('tests.*, test_courses.course_id').where('test_courses.course_id = ?', @course.id)
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
    @course = Course.find(params[:course_id])
  end

  # GET /tests/1/edit
  def edit
    @course = Course.find(params[:course_id])
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(
      title: params[:test][:title], date: params[:test][:date], 
      min_score: params[:test][:min_score], max_score: params[:test][:max_score]
    )

    @test_course = TestCourse.new(
      test: @test, course: Course.find(params[:course_id])
    )

    Enroll.where(course_id: params[:course_id]).each do |enroll|
      Score.create( student_id: enroll.student_id, test: @test, value: -2)
    end

    puts @test_course.as_json

    respond_to do |format|
      if @test.save && @test_course.save
        format.html { redirect_to course_path(params[:course_id]), notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(title: params[:test][:title], date: params[:test][:date], 
        min_score: params[:test][:min_score], max_score: params[:test][:max_score])
        format.html { redirect_to course_path(params[:course_id]), notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    Score.where(test: @test).each do |score|
      score.destroy
    end
    @test.destroy
    respond_to do |format|
      format.html { redirect_to course_tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.fetch(:test, {})
    end
end
