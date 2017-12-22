class ScoresController < ApplicationController
  before_action :set_score, only: [:show, :edit, :update, :destroy]

  # GET /scores
  # GET /scores.json
  def index
    @course = Course.find(params[:course_id])
    @test = Test.find(params[:test_id])
    @scores = Score.joins(:student)
      .select('scores.*, students.first_name, students.last_name')
      .where(test: @test)
  end

  # GET /scores/1
  # GET /scores/1.json
  def show
  end

  # GET /scores/new
  def new
    @score = Score.new
  end

  # GET /scores/1/edit
  def edit
  end

  # POST /scores
  # POST /scores.json
  def create
    course = Course.find(params[:course_id])
    test = Test.find(params[:test_id])
    respond_to do |format|
      begin
        puts params[:absent].nil?
        i = 0
        Score.where(test: test).each do |score|
          if !score.update(value: (params[:"absent#{i}"]? -2 : params[:"score-input#{i}"]))
            raise
          end
          i += 1
        end
      rescue => exception
        format.html { render :edit }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      else
        format.html { redirect_to course_test_scores_path(course, test), notice: 'Scores were successfully updated.' }
        format.json { render :show, status: :ok, location: course_test_scores_path(course, test) }
      end
    end
  end

  # PATCH/PUT /scores/1
  # PATCH/PUT /scores/1.json
  def update
    respond_to do |format|
      if @score.update(score_params)
        format.html { redirect_to @score, notice: 'Score was successfully updated.' }
        format.json { render :show, status: :ok, location: @score }
      else
        format.html { render :edit }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scores/1
  # DELETE /scores/1.json
  def destroy
    @score.destroy
    respond_to do |format|
      format.html { redirect_to scores_url, notice: 'Score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_params
      params.fetch(:score, {})
    end
end
