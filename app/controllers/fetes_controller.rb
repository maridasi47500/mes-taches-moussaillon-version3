class FetesController < ApplicationController
  include MyhelperHelper
  before_action :set_fete, only: %i[ show edit update destroy ]
  layout false, only: [:countries]
  before_action :allthecountries, only: [:countries]

  # GET /fetes or /fetes.json
  def index
    @fetes = Fete.all
  end

  # GET /fetes/1 or /fetes/1.json
  def show
  end

  # GET /fetes/new
  def new
    @fete = Fete.new
  end

  # GET /fetes/1/edit
  def edit
  end

  # POST /fetes or /fetes.json
  def create
    @fete = Fete.new(fete_params)

    respond_to do |format|
      if @fete.save
        format.html { redirect_to @fete, notice: "Fete was successfully created." }
        format.json { render :show, status: :created, location: @fete }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fete.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fetes/1 or /fetes/1.json
  def update
    respond_to do |format|
      if @fete.update(fete_params)
        format.html { redirect_to @fete, notice: "Fete was successfully updated." }
        format.json { render :show, status: :ok, location: @fete }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fetes/1 or /fetes/1.json
  def destroy
    @fete.destroy
    respond_to do |format|
      format.html { redirect_to fetes_url, notice: "Fete was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fete
      @fete = Fete.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fete_params
      params.require(:fete).permit(:name_fr, :name_en, :name_de, :date,:country_ids=>[])
    end
end
