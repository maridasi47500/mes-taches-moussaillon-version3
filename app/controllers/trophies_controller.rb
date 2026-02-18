class TrophiesController < ApplicationController
  before_action :set_trophy, only: %i[ show edit update destroy ]

  def json
@t=Trophy.findbyname(params[:name])
render json: @t
  end
  # GET /trophies or /trophies.json
  def index
    @trophies = Trophy.all
  end

  # GET /trophies/1 or /trophies/1.json
  def show
  end

  # GET /trophies/new
  def new
    @trophy = Trophy.new
  end

  # GET /trophies/1/edit
  def edit
  end

  # POST /trophies or /trophies.json
  def create
    @trophy = Trophy.new(trophy_params)

    respond_to do |format|
      if @trophy.save
        format.html { redirect_to @trophy, notice: "Trophy was successfully created." }
        format.json { render :show, status: :created, location: @trophy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trophy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trophies/1 or /trophies/1.json
  def update
    respond_to do |format|
      if @trophy.update(trophy_params)
        format.html { redirect_to @trophy, notice: "Trophy was successfully updated." }
        format.json { render :show, status: :ok, location: @trophy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trophy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trophies/1 or /trophies/1.json
  def destroy
    @trophy.destroy
    respond_to do |format|
      format.html { redirect_to trophies_url, notice: "Trophy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trophy
      @trophy = Trophy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trophy_params
      params.require(:trophy).permit(:name, :image)
    end
end
