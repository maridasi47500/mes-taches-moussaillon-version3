class PlantspeciesController < ApplicationController
  before_action :set_plantspecy, only: %i[ show edit update destroy ]

  # GET /plantspecies or /plantspecies.json
  def index
    @plantspecies = Plantspecie.all
  end

  # GET /plantspecies/1 or /plantspecies/1.json
  def show
  end

  # GET /plantspecies/new
  def new
    @plantspecie = Plantspecie.new
  end

  # GET /plantspecies/1/edit
  def edit
  end

  # POST /plantspecies or /plantspecies.json
  def create
    @plantspecie = Plantspecie.new(plantspecy_params)

    respond_to do |format|
      if @plantspecie.save
        format.html { redirect_to @plantspecie, notice: "Plantspecie was successfully created." }
        format.json { render :show, status: :created, location: @plantspecie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plantspecie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plantspecies/1 or /plantspecies/1.json
  def update
    respond_to do |format|
      if @plantspecie.update(plantspecy_params)
        format.html { redirect_to @plantspecie, notice: "Plantspecie was successfully updated." }
        format.json { render :show, status: :ok, location: @plantspecie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plantspecie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plantspecies/1 or /plantspecies/1.json
  def destroy
    @plantspecie.destroy
    respond_to do |format|
      format.html { redirect_to plantspecies_url, notice: "Plantspecie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plantspecy
      @plantspecie = Plantspecie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plantspecy_params
      params.require(:plantspecie).permit(:name, :image)
    end
end
