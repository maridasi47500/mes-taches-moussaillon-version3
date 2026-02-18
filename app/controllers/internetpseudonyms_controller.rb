class InternetpseudonymsController < ApplicationController
  before_action :set_internetpseudonym, only: %i[ show edit update destroy ]
  include MyhelperHelper
  before_action :find_allthecities, only: %i[ cities ]
  layout false, only: %i[ cities ]
  def cities
  end

  # GET /internetpseudonyms or /internetpseudonyms.json
  def index
    @internetpseudonyms = Internetpseudonym.all
  end

  # GET /internetpseudonyms/1 or /internetpseudonyms/1.json
  def show
  end

  # GET /internetpseudonyms/new
  def new
    @internetpseudonym = Internetpseudonym.new
  end

  # GET /internetpseudonyms/1/edit
  def edit
  end

  # POST /internetpseudonyms or /internetpseudonyms.json
  def create
    @internetpseudonym = Internetpseudonym.new(internetpseudonym_params)

    respond_to do |format|
      if @internetpseudonym.save
        format.html { redirect_to @internetpseudonym, notice: "Internetpseudonym was successfully created." }
        format.json { render :show, status: :created, location: @internetpseudonym }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @internetpseudonym.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internetpseudonyms/1 or /internetpseudonyms/1.json
  def update
    respond_to do |format|
      if @internetpseudonym.update(internetpseudonym_params)
        format.html { redirect_to @internetpseudonym.surname, notice: "Internetpseudonym was successfully updated." }
        format.json { render :show, status: :ok, location: @internetpseudonym }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @internetpseudonym.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internetpseudonyms/1 or /internetpseudonyms/1.json
  def destroy
    @internetpseudonym.destroy
    respond_to do |format|
      format.html { redirect_to internetpseudonyms_url, notice: "Internetpseudonym was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internetpseudonym
      @internetpseudonym = Internetpseudonym.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def internetpseudonym_params
      params.fetch(:internetpseudonym, {}).permit(:city_ids=>[])
    end
end
