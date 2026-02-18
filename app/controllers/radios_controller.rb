class RadiosController < ApplicationController
  before_action :set_radio, only: %i[ show edit update destroy ]
layout false, only: [:cities]
def json
@cities=Radio.findbyname(params[:name])
render json: @cities
end
def cities
@cities=City.findbyid(params[:id])
end
  # GET /radios or /radios.json
  def index
    @radios = Radio.all
  end

  # GET /radios/1 or /radios/1.json
  def show
  end

  # GET /radios/new
  def new
    @radio = Radio.new
  end

  # GET /radios/1/edit
  def edit
  end

  # POST /radios or /radios.json
  def create
    @radio = Radio.new(radio_params)

    respond_to do |format|
      if @radio.save
        format.html { redirect_to @radio, notice: "Radio was successfully created." }
        format.json { render :show, status: :created, location: @radio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @radio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /radios/1 or /radios/1.json
  def update
    respond_to do |format|
      if @radio.update(radio_params)
        format.html { redirect_to @radio, notice: "Radio was successfully updated." }
        format.json { render :show, status: :ok, location: @radio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @radio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /radios/1 or /radios/1.json
  def destroy
    @radio.destroy
    respond_to do |format|
      format.html { redirect_to radios_url, notice: "Radio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_radio
      @radio = Radio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def radio_params
      params.require(:radio).permit(:frequency, :radioname, :motto_fr, :motto_en, :motto_de,:city_ids=>[])
    end
end
