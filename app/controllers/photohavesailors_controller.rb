class PhotohavesailorsController < ApplicationController
  before_action :set_photohavesailor, only: %i[ show edit update destroy ]

  # GET /photohavesailors or /photohavesailors.json
  def index
    @photohavesailors = Photohavesailor.all
  end

  # GET /photohavesailors/1 or /photohavesailors/1.json
  def show
  end

  # GET /photohavesailors/new
  def new
    @photohavesailor = Photohavesailor.new
  end

  # GET /photohavesailors/1/edit
  def edit
  end

  # POST /photohavesailors or /photohavesailors.json
  def create
    @photohavesailor = Photohavesailor.new(photohavesailor_params)

    respond_to do |format|
      if @photohavesailor.save
        format.html { redirect_to @photohavesailor, notice: "Photohavesailor was successfully created." }
        format.json { render :show, status: :created, location: @photohavesailor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @photohavesailor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photohavesailors/1 or /photohavesailors/1.json
  def update
    respond_to do |format|
      if @photohavesailor.update(photohavesailor_params)
        format.html { redirect_to @photohavesailor, notice: "Photohavesailor was successfully updated." }
        format.json { render :show, status: :ok, location: @photohavesailor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @photohavesailor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photohavesailors/1 or /photohavesailors/1.json
  def destroy
    @photohavesailor.destroy
    respond_to do |format|
      format.html { redirect_to photo_url(@photohavesailor.photo), notice: "Photohavesailor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photohavesailor
      @photohavesailor = Photohavesailor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def photohavesailor_params
      params.fetch(:photohavesailor, {})
    end
end
