class LessonRecordingsController < ApplicationController
  before_action :set_lesson_recording, only: %i[ show edit update destroy ]

  # GET /lesson_recordings or /lesson_recordings.json
  def index
    @lesson_recordings = LessonRecording.all
  end

  # GET /lesson_recordings/1 or /lesson_recordings/1.json
  def show
  end

  # GET /lesson_recordings/new
  def new
    @lesson_recording = LessonRecording.new
  end

  # GET /lesson_recordings/1/edit
  def edit
  end

  # POST /lesson_recordings or /lesson_recordings.json
  def create
    @lesson_recording = LessonRecording.new(lesson_recording_params)

    respond_to do |format|
      if @lesson_recording.save
        format.html { redirect_to @lesson_recording, notice: "Lesson recording was successfully created." }
        format.json { render :show, status: :created, location: @lesson_recording }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson_recording.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_recordings/1 or /lesson_recordings/1.json
  def update
    respond_to do |format|
      if @lesson_recording.update(lesson_recording_params)
        format.html { redirect_to @lesson_recording, notice: "Lesson recording was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson_recording }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson_recording.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_recordings/1 or /lesson_recordings/1.json
  def destroy
    @lesson_recording.destroy
    respond_to do |format|
      format.html { redirect_to lesson_recordings_url, notice: "Lesson recording was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_recording
      @lesson_recording = LessonRecording.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_recording_params
      params.require(:lesson_recording).permit(:recordmyphrasesandwords, :recordmywords, :myownphrasesandwords, :contentmyownphrasesandwords, :myownwords, :contentmyownwords, :contentrecordmyphrasesandwords1, :recordmywords1, :myownphrasesandwords1, :contentmyownphrasesandwords1, :myownwords1, :contentmyownwords1, :contentrecordmyphrasesandwords2, :recordmywords2, :myownphrasesandwords2, :contentmyownphrasesandwords2, :myownwords2, :contentmyownwords2,:recordmyphrasesandwords1=>[],:recordmyphrasesandwords2=>[])
    end
end
