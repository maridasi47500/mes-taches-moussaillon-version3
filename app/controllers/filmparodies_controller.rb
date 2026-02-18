class FilmparodiesController < ApplicationController
  before_action :set_filmparody, only: %i[ show edit update destroy editroles]
layout false, only: [:actors,:places]
def places
@places=Place.findbyid(params[:id])
end
  def json
@films=Filmparody.findbyname(params[:name])
render json: @films
  end
  def actors
@people=Person.findbyid(params[:id])
  end

  def editroles
  end


  # GET /filmparodies or /filmparodies.json
  def index
    @filmparodies = Filmparody.all
  end

  # GET /filmparodies/1 or /filmparodies/1.json
  def show
  end

  # GET /filmparodies/new
  def new
    @filmparody = Filmparody.new
  end

  # GET /filmparodies/1/edit
  def edit
  end

  # POST /filmparodies or /filmparodies.json
  def create
    @filmparody = Filmparody.new(filmparody_params)

    respond_to do |format|
      if @filmparody.save
        format.html { redirect_to @filmparody, notice: "Filmparodie was successfully created." }
        format.json { render :show, status: :created, location: @filmparody }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @filmparody.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /filmparodies/1 or /filmparodies/1.json
  def update
    respond_to do |format|
      if @filmparody.update(filmparody_params)
        format.html { redirect_to @filmparody, notice: "Filmparodie was successfully updated." }
        format.json { render :show, status: :ok, location: @filmparody }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @filmparody.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /filmparodies/1 or /filmparodies/1.json
  def destroy
    @filmparody.destroy
    respond_to do |format|
      format.html { redirect_to filmparodies_url, notice: "Filmparodie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_filmparody
      @filmparody = Filmparody.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def filmparody_params
      params.require(:filmparody).permit(:name_fr, :name_en, :name_de, :image,:filmparodiehaveactors=>{},:actor_ids=>[],:place_ids=>[])
    end
end
