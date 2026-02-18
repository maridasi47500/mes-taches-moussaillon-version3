class PeoplehaveweaknessesController < ApplicationController
  before_action :set_peoplehaveweakness, only: %i[ show edit update destroy ]
layout false, only: [:weaknesses,:linkspousepeople]
def weaknesses
@weaknesses=Weakness.findbyid(params[:id])
end
def linkspousepeople
@linkspousepeople=Linkspouseperson.findbyid(params[:id])
end
  # GET /peoplehaveweaknesses or /peoplehaveweaknesses.json
  def index
    @peoplehaveweaknesses = Peoplehaveweakness.all
  end

  # GET /peoplehaveweaknesses/1 or /peoplehaveweaknesses/1.json
  def show
  end

  # GET /peoplehaveweaknesses/new
  def new
    @peoplehaveweakness = Peoplehaveweakness.new(user: current_user)
  end

  # GET /peoplehaveweaknesses/1/edit
  def edit
  end

  # POST /peoplehaveweaknesses or /peoplehaveweaknesses.json
  def create
    @peoplehaveweakness = Peoplehaveweakness.new(peoplehaveweakness_params)

    respond_to do |format|
      if @peoplehaveweakness.save
        format.html { redirect_to @peoplehaveweakness, notice: "Peoplehaveweakness was successfully created." }
        format.json { render :show, status: :created, location: @peoplehaveweakness }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @peoplehaveweakness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /peoplehaveweaknesses/1 or /peoplehaveweaknesses/1.json
  def update
    respond_to do |format|
      if @peoplehaveweakness.update(peoplehaveweakness_params)
        format.html { redirect_to @peoplehaveweakness, notice: "Peoplehaveweakness was successfully updated." }
        format.json { render :show, status: :ok, location: @peoplehaveweakness }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @peoplehaveweakness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peoplehaveweaknesses/1 or /peoplehaveweaknesses/1.json
  def destroy
    @peoplehaveweakness.destroy
    respond_to do |format|
      format.html { redirect_to peoplehaveweaknesses_url, notice: "Peoplehaveweakness was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peoplehaveweakness
      @peoplehaveweakness = Peoplehaveweakness.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def peoplehaveweakness_params
      params.require(:peoplehaveweakness).permit(:person_id, :weakness_id, :user_id, :linkspouseperson_id)
    end
end
