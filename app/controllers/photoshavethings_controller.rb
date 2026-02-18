class PhotoshavethingsController < ApplicationController
  before_action :set_photoshavething, only: %i[ show edit update destroy ]
layout false, only: [:people]
  # GET /photoshavethings or /photoshavethings.json
  def people
@people=Person.findbyid(params[:id])
  end
  def index
    @photoshavethings = Photoshavething.all
  end

  # GET /photoshavethings/1 or /photoshavethings/1.json
  def show
  end

  # GET /photoshavethings/new
  def new
    @photoshavething = Photoshavething.new
  end

  # GET /photoshavethings/1/edit
  def edit
  end

  # POST /photoshavethings or /photoshavethings.json
  def create
    @photoshavething = Photoshavething.new(photoshavething_params)

    respond_to do |format|
      if @photoshavething.save
        format.html { redirect_to @photoshavething.photo, notice: "Photoshavething was successfully created." }
        format.json { render :show, status: :created, location: @photoshavething }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @photoshavething.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photoshavethings/1 or /photoshavethings/1.json
  def update
    respond_to do |format|
      if @photoshavething.update(photoshavething_params)
        format.html { redirect_to @photoshavething.photo, notice: "Photoshavething was successfully updated." }
        format.json { render :show, status: :ok, location: @photoshavething }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @photoshavething.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photoshavethings/1 or /photoshavethings/1.json
  def destroy
    @photoshavething.destroy
    respond_to do |format|
      format.html { redirect_to photoshavethings_url, notice: "Photoshavething was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photoshavething
      @photoshavething = Photoshavething.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def photoshavething_params
      params.require(:photoshavething).permit(:thing_id, :photo_id,:owner_ids=>[])
    end
end
