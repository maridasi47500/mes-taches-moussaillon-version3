class HistoricalCharactersController < ApplicationController
  before_action :set_historical_character, only: %i[ show edit update destroy ]

  # GET /historical_characters or /historical_characters.json
  def index
    @historical_characters = HistoricalCharacter.all
  end

  # GET /historical_characters/1 or /historical_characters/1.json
  def show
  end

  # GET /historical_characters/new
  def new
    @historical_character = HistoricalCharacter.new
  end

  # GET /historical_characters/1/edit
  def edit
  end

  # POST /historical_characters or /historical_characters.json
  def create
    @historical_character = HistoricalCharacter.new(historical_character_params)

    respond_to do |format|
      if @historical_character.save
        format.html { redirect_to @historical_character, notice: "Historical character was successfully created." }
        format.json { render :show, status: :created, location: @historical_character }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @historical_character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historical_characters/1 or /historical_characters/1.json
  def update
    respond_to do |format|
      if @historical_character.update(historical_character_params)
        format.html { redirect_to @historical_character, notice: "Historical character was successfully updated." }
        format.json { render :show, status: :ok, location: @historical_character }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @historical_character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historical_characters/1 or /historical_characters/1.json
  def destroy
    @historical_character.destroy
    respond_to do |format|
      format.html { redirect_to historical_characters_url, notice: "Historical character was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historical_character
      @historical_character = HistoricalCharacter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def historical_character_params
      params.require(:historical_character).permit(:name, :image)
    end
end
