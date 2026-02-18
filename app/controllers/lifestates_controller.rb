class LifestatesController < ApplicationController
include MyhelperHelper
  before_action :set_lifestate, only: %i[ show edit update destroy mytickets ]
  before_action :allthepeople, only: [:people]
layout false, only: [:people]
  def mytickets
    @req=Personhavelifestate.find_by(person_id: params[:person_id], lifestate: @lifestate).requeststopeople
  end

  # GET /lifestates or /lifestates.json
  def index
    @lifestates = Lifestate.all
  end

  # GET /lifestates/1 or /lifestates/1.json
  def show
  end

  # GET /lifestates/new
  def new
    @lifestate = Lifestate.new
  end

  # GET /lifestates/1/edit
  def edit
  end

  # POST /lifestates or /lifestates.json
  def create
    @lifestate = Lifestate.new(lifestate_params)

    respond_to do |format|
      if @lifestate.save
        format.html { redirect_to @lifestate, notice: "Lifestate was successfully created." }
        format.json { render :show, status: :created, location: @lifestate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lifestate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lifestates/1 or /lifestates/1.json
  def update
    respond_to do |format|
      if @lifestate.update(lifestate_params)
        format.html { redirect_to @lifestate, notice: "Lifestate was successfully updated." }
        format.json { render :show, status: :ok, location: @lifestate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lifestate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lifestates/1 or /lifestates/1.json
  def destroy
    @lifestate.destroy
    respond_to do |format|
      format.html { redirect_to lifestates_url, notice: "Lifestate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lifestate
      @lifestate = Lifestate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lifestate_params
      params.require(:lifestate).permit(:name_fr, :name_en, :name_de,:person_ids=>[])
    end
end
