class LessonContentsController < ApplicationController
  before_action :set_lesson_content, only: %i[ show edit update destroy repeatafterpro]

  # GET /lesson_contents or /lesson_contents.json
def recordbook
end
def repeatafterpro
@rec=[@lesson_content.lesson_recordings.new]
end
  def index
    @lesson_contents = LessonContent.all
  end

  # GET /lesson_contents/1 or /lesson_contents/1.json
  def show
  end

  # GET /lesson_contents/new
  def new
    @lesson_content = LessonContent.new
  end

  # GET /lesson_contents/1/edit
  def edit
  end

  # POST /lesson_contents or /lesson_contents.json
  def create
    @lesson_content = LessonContent.new(lesson_content_params)

    respond_to do |format|
      if @lesson_content.save
        format.html { redirect_to @lesson_content, notice: "Lesson content was successfully created." }
        format.json { render :show, status: :created, location: @lesson_content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_contents/1 or /lesson_contents/1.json
  def update
    respond_to do |format|
      if params[:lesson_application] && @lesson_content.update(lesson_content_params)
@path = @lesson_content.lesson_recordings.length > 0 ? recordbook_lesson_path(@lesson_content.lesson.id) : @lesson_content.lesson
        format.html { redirect_to @path, notice: "Lesson content was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson_content }
      elsif params[:lesson_sentence] && @lesson_content.update(lesson_sentence_params)
@path = @lesson_content.lesson_recordings.length > 0 ? recordbook_lesson_path(@lesson_content.lesson.id) : @lesson_content.lesson
        format.html { redirect_to (@path), notice: "Lesson content was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_contents/1 or /lesson_contents/1.json
  def destroy
    @lesson_content.destroy
    respond_to do |format|
      format.html { redirect_to lesson_contents_url, notice: "Lesson content was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_content
      @lesson_content = LessonContent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_sentence_params
      params.require(:lesson_sentence).permit(:recordmyphrasesandwords, :recordmywords, :myownphrasesandwords, :contentmyownphrasesandwords, :myownwords, :contentmyownwords, :contentrecordmyphrasesandwords1, :recordmywords1, :myownphrasesandwords1, :contentmyownphrasesandwords1, :myownwords1, :contentmyownwords1, :contentrecordmyphrasesandwords2, :recordmywords2, :myownphrasesandwords2, :contentmyownphrasesandwords2, :myownwords2, :contentmyownwords2,:recordmyphrasesandwords1=>[],:recordmyphrasesandwords2=>[],:lesson_recordings_attributes=>{})
    end
    def lesson_content_params
      params.require(:lesson_application).permit(:recordmyphrasesandwords, :recordmywords, :myownphrasesandwords, :contentmyownphrasesandwords, :myownwords, :contentmyownwords, :contentrecordmyphrasesandwords1, :recordmywords1, :myownphrasesandwords1, :contentmyownphrasesandwords1, :myownwords1, :contentmyownwords1, :contentrecordmyphrasesandwords2, :recordmywords2, :myownphrasesandwords2, :contentmyownphrasesandwords2, :myownwords2, :contentmyownwords2,:recordmyphrasesandwords1=>[],:recordmyphrasesandwords2=>[],:lesson_recordings_attributes=>{})
    end
end
