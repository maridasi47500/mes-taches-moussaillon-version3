class TvseriesparodiesController < ApplicationController
  before_action :set_tvseriesparody, only: %i[ show edit update destroy editroles]
layout false, only: [:actors,:places]
def places
@places=Place.findbyid(params[:id])
end

  def json
@films=Tvseriesparody.findbyname(params[:name])
render json: @films
  end
  def actors
@people=Person.findbyid(params[:id])
  end

  def editroles
  end


  # GET /tvseriesparodies or /tvseriesparodies.json
  def index
    @tvseriesparodies = Tvseriesparody.all
  end

  # GET /tvseriesparodies/1 or /tvseriesparodies/1.json
  def show
  end

  # GET /tvseriesparodies/new
  def new
    @tvseriesparody = Tvseriesparody.new
  end

  # GET /tvseriesparodies/1/edit
  def edit
  end

  # POST /tvseriesparodies or /tvseriesparodies.json
  def create
    @tvseriesparody = Tvseriesparody.new(tvseriesparody_params)

    respond_to do |format|
      if @tvseriesparody.save
        format.html { redirect_to @tvseriesparody, notice: "Tvseriesparodie was successfully created." }
        format.json { render :show, status: :created, location: @tvseriesparody }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tvseriesparody.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tvseriesparodies/1 or /tvseriesparodies/1.json
  def update
    respond_to do |format|
      if @tvseriesparody.update(tvseriesparody_params)
        format.html { redirect_to @tvseriesparody, notice: "Tvseriesparodie was successfully updated." }
        format.json { render :show, status: :ok, location: @tvseriesparody }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tvseriesparody.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tvseriesparodies/1 or /tvseriesparodies/1.json
  def destroy
    @tvseriesparody.destroy
    respond_to do |format|
      format.html { redirect_to tvseriesparodies_url, notice: "Tvseriesparodie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tvseriesparody
      @tvseriesparody = Tvseriesparody.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tvseriesparody_params
      params.require(:tvseriesparody).permit(:name_fr, :name_en, :name_de, :image,:tvseriesparodiehaveactors_attributes=>{},:actor_ids=>[],:place_ids=>[])
    end
end
