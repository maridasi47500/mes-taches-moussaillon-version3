class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[samplecontents samplerecordings languages contents words recordings show edit update destroy recordbook title]
def title
@rec=[@lesson.lesson_titles.new]

end
def recordbook
end
def languages
render layout: false

end
def samplecontents
render layout: false
end
def contents
render layout: false
end
def words
end
def recordings
@content=LessonContent.find(params[:contentid])
if @content.is_a?(LessonSentence)
@sentences=[@content]
render :sentences
elsif @content.is_a?(LessonApplication)
@appli=[@content]
render :applications
end
end

def samplerecordings
end

  # GET /lessons or /lessons.json
  def index
    @lessons = Lesson.all
  end

  # GET /lessons/1 or /lessons/1.json
  def show
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit
case params[:type]
when 'c'
@sentences=[@lesson.lesson_sentences.new(content_en:'',content_fr:'',content_de:'')]
render :sentences
when 'sc'
@appli=[@lesson.lesson_applications.new(content_en:'',content_fr:'',content_de:'')]
render :applications
when 'l'
@lesson.lesson_languages.new
render :languages
end
  end

  # POST /lessons or /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to @lesson, notice: "Lesson was successfully created." }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1 or /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: "Lesson was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1 or /lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url, notice: "Lesson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
@sot=Lesson.new
@am=Lesson.new
    end

    # Only allow a list of trusted parameters through.
    def lesson_params
      params.require(:lesson).permit(:title, :description, :user_id, :image,:recordmyphrasesandwords, :recordmywords, :myownphrasesandwords, :contentmyownphrasesandwords, :myownwords, :contentmyownwords, :contentrecordmyphrasesandwords1, :recordmywords1, :myownphrasesandwords1, :contentmyownphrasesandwords1, :myownwords1, :contentmyownwords1, :contentrecordmyphrasesandwords2, :recordmywords2, :myownphrasesandwords2, :contentmyownphrasesandwords2, :myownwords2, :contentmyownwords2,:recordmyphrasesandwords1=>[],:recordmyphrasesandwords2=>[],:lesson_applications_attributes=>{}, :lesson_language_attributes=>{}, :lesson_sentences_attributes=>{},:lesson_languages_attributes=>{},:lesson_titles_attributes=>{})
    end
end
