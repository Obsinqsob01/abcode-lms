class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.all
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)

    @lesson.topic_id = params[:topic_id]

    @lesson.save

    # if params[:is_quiz]
    #   @quiz = Quiz.new

    #   @quiz.name = params[:quiz_name]
    #   @quiz.content = params[:quiz_content]
    #   @quiz.answer1 = params[:quiz_answer1]
    #   @quiz.answer2 = params[:quiz_answer2]
    #   @quiz.answer3 = params[:quiz_answer3]
    #   @quiz.which_correct = params[:quiz_which_correct]

    # end

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to course_topic_lessons_path(@lesson), notice: 'La lección se creó correctamente' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to course_topic_lesson_path(@lesson), notice: 'La lección se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to course_topic_lessons_path, notice: 'La lección de destruyó correctamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:name, :content, :is_quiz)
    end

    def quiz_params
      params.require(:quiz).permit(:quiz_name, :quiz_content, :quiz_answer1, :quiz_answer2, :quiz_answer3, :quiz_which_correct)
    end
end
