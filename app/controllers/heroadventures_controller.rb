class HeroadventuresController < ApplicationController
  before_action :set_heroadventure, only: %i[ show edit update destroy ]

def json
@h=Heroadventure.findbyname(params[:name])
render json: @h
end
  # GET /heroadventures or /heroadventures.json
  def index
    @heroadventures = Heroadventure.all
  end

  # GET /heroadventures/1 or /heroadventures/1.json
  def show
  end

  # GET /heroadventures/new
  def new
    @heroadventure = Heroadventure.new
  end

  # GET /heroadventures/1/edit
  def edit
  end

  # POST /heroadventures or /heroadventures.json
  def create
    @heroadventure = Heroadventure.new(heroadventure_params)

    respond_to do |format|
      if @heroadventure.save
        format.html { redirect_to @heroadventure, notice: "Heroadventure was successfully created." }
        format.json { render :show, status: :created, location: @heroadventure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @heroadventure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /heroadventures/1 or /heroadventures/1.json
  def update
    respond_to do |format|
      if @heroadventure.update(heroadventure_params)
        format.html { redirect_to @heroadventure, notice: "Heroadventure was successfully updated." }
        format.json { render :show, status: :ok, location: @heroadventure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @heroadventure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /heroadventures/1 or /heroadventures/1.json
  def destroy
    @heroadventure.destroy
    respond_to do |format|
      format.html { redirect_to heroadventures_url, notice: "Heroadventure was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_heroadventure
      @heroadventure = Heroadventure.find(params[:id])
      @story= params[:story_id] ? Story.find(params[:story_id]) : @heroadventure.story
      @nextadventure = @heroadventure.nextadventure
      @previousadventure = @heroadventure.previousadventure
    end

    # Only allow a list of trusted parameters through.
    def heroadventure_params
      params.fetch(:heroadventure, {}).permit(:content_fr,:content_en,:content_de,:image)
    end
end
