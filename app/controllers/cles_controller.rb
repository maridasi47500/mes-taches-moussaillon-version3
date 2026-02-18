class ClesController < ApplicationController
  before_action :set_cle, only: %i[ show edit update destroy ]
layout false, only:[:people]
  # GET /cles or /cles.json
	def people
	@people=Person.findbyid(params[:id])
	end
  def index
    @cles = Cle.all
  end

  # GET /cles/1 or /cles/1.json
  def show
  end

  # GET /cles/new
  def new
    @cle = Cle.new(reintegration: nil)
  end

  # GET /cles/1/edit
  def edit
  end

  # POST /cles or /cles.json
  def create
    @cle = Cle.new(cle_params)

    respond_to do |format|
      if @cle.save
        format.html { redirect_to @cle, notice: "Cle was successfully created." }
        format.json { render :show, status: :created, location: @cle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cles/1 or /cles/1.json
  def update
    respond_to do |format|
      if @cle.update(cle_params)
        format.html { redirect_to @cle, notice: "Cle was successfully updated." }
        format.json { render :show, status: :ok, location: @cle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cles/1 or /cles/1.json
  def destroy
    @cle.destroy
    respond_to do |format|
      format.html { redirect_to cles_url, notice: "Cle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cle
      @cle = Cle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cle_params
      params.require(:cle).permit(:date, :perception, :reintegration, :myarmygrade, :person_id, :observation)
    end
end
