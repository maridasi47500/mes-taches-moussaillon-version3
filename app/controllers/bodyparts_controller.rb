class BodypartsController < ApplicationController
  before_action :set_bodypart, only: %i[ show edit update destroy ]

  # GET /bodyparts or /bodyparts.json
  def index
    @bodyparts = Bodypart.all
  end

  # GET /bodyparts/1 or /bodyparts/1.json
  def show
  end

  # GET /bodyparts/new
  def new
    @bodypart = Bodypart.new
  end

  # GET /bodyparts/1/edit
  def edit
  end

  # POST /bodyparts or /bodyparts.json
  def create
    @bodypart = Bodypart.new(bodypart_params)

    respond_to do |format|
      if @bodypart.save
        format.html { redirect_to @bodypart, notice: "Bodypart was successfully created." }
        format.json { render :show, status: :created, location: @bodypart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bodypart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bodyparts/1 or /bodyparts/1.json
  def update
    respond_to do |format|
      if @bodypart.update(bodypart_params)
        format.html { redirect_to @bodypart, notice: "Bodypart was successfully updated." }
        format.json { render :show, status: :ok, location: @bodypart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bodypart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bodyparts/1 or /bodyparts/1.json
  def destroy
    @bodypart.destroy
    respond_to do |format|
      format.html { redirect_to bodyparts_url, notice: "Bodypart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bodypart
      @bodypart = Bodypart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bodypart_params
      params.require(:bodypart).permit(:name_en, :name_fr, :name_de, :image)
    end
end
