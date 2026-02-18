class OlympiceventsController < ApplicationController
  before_action :set_olympicevent, only: %i[ show edit update destroy ]

  # GET /olympicevents or /olympicevents.json
  def showwithcode
    @edition=Edition.find(params[:id])
    @events = @edition.editionshaveevents
  end
  def index
    @olympicevents = Olympicevent.all
  end

  # GET /olympicevents/1 or /olympicevents/1.json
  def show
  end

  # GET /olympicevents/new
  def new
    @olympicevent = Olympicevent.new
  end

  # GET /olympicevents/1/edit
  def edit
  end

  # POST /olympicevents or /olympicevents.json
  def create
    @olympicevent = Olympicevent.new(olympicevent_params)

    respond_to do |format|
      if @olympicevent.save
        format.html { redirect_to @olympicevent, notice: "Olympicevent was successfully created." }
        format.json { render :show, status: :created, location: @olympicevent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @olympicevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /olympicevents/1 or /olympicevents/1.json
  def update
    respond_to do |format|
      if @olympicevent.update(olympicevent_params)
        format.html { redirect_to @olympicevent, notice: "Olympicevent was successfully updated." }
        format.json { render :show, status: :ok, location: @olympicevent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @olympicevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /olympicevents/1 or /olympicevents/1.json
  def destroy
    @olympicevent.destroy
    respond_to do |format|
      format.html { redirect_to olympicevents_url, notice: "Olympicevent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_olympicevent
      @olympicevent = Olympicevent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def olympicevent_params
      params.require(:olympicevent).permit(:name)
    end
end
