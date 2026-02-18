class ArmycompagniesController < ApplicationController
  before_action :set_armycompagny, only: %i[ show edit update destroy ]
  def person
@people=Person.findbyid(params[:id])
render layout: false
end

  # GET /armycompagnies or /armycompagnies.json
  def index
    @armycompagnies = Armycompagny.all
  end

  # GET /armycompagnies/1 or /armycompagnies/1.json
  def show
  end

  # GET /armycompagnies/new
  def new
    @armycompagny = Armycompagny.new
  end

  # GET /armycompagnies/1/edit
  def edit
  end

  # POST /armycompagnies or /armycompagnies.json
  def create
    @armycompagny = Armycompagny.new(armycompagny_params)

    respond_to do |format|
      if @armycompagny.save
        format.html { redirect_to @armycompagny, notice: "Armycompagny was successfully created." }
        format.json { render :show, status: :created, location: @armycompagny }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @armycompagny.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /armycompagnies/1 or /armycompagnies/1.json
  def update
    respond_to do |format|
      if @armycompagny.update(armycompagny_params)
        format.html { redirect_to @armycompagny, notice: "Armycompagny was successfully updated." }
        format.json { render :show, status: :ok, location: @armycompagny }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @armycompagny.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /armycompagnies/1 or /armycompagnies/1.json
  def destroy
    @armycompagny.destroy
    respond_to do |format|
      format.html { redirect_to armycompagnies_url, notice: "Armycompagny was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_armycompagny
      @armycompagny = Armycompagny.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def armycompagny_params
      params.require(:armycompagny).permit(:name,:person_ids=>[])
    end
end
