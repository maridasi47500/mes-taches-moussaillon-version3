class TvprogramsController < ApplicationController
  before_action :set_tvprogram, only: %i[ show edit update destroy ]

  # GET /tvprograms or /tvprograms.json
  def index
    @tvprograms = Tvprogram.all
  end

  # GET /tvprograms/1 or /tvprograms/1.json
  def show
  end

  # GET /tvprograms/new
  def new
    @tvprogram = Tvprogram.new
  end

  # GET /tvprograms/1/edit
  def edit
  end

  # POST /tvprograms or /tvprograms.json
  def create
    @tvprogram = Tvprogram.new(tvprogram_params)

    respond_to do |format|
      if @tvprogram.save
        format.html { redirect_to @tvprogram, notice: "Tvprogram was successfully created." }
        format.json { render :show, status: :created, location: @tvprogram }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tvprogram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tvprograms/1 or /tvprograms/1.json
  def update
    respond_to do |format|
      if @tvprogram.update(tvprogram_params)
        format.html { redirect_to @tvprogram, notice: "Tvprogram was successfully updated." }
        format.json { render :show, status: :ok, location: @tvprogram }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tvprogram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tvprograms/1 or /tvprograms/1.json
  def destroy
    @tvprogram.destroy
    respond_to do |format|
      format.html { redirect_to tvprograms_url, notice: "Tvprogram was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tvprogram
      @tvprogram = Tvprogram.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tvprogram_params
      params.require(:tvprogram).permit(:name, :image)
    end
end
