class SkinTypesController < ApplicationController
  before_action :set_skin_type, only: %i[ show edit update destroy ]

  # GET /skin_types or /skin_types.json
  def index
    @skin_types = SkinType.all
  end

  # GET /skin_types/1 or /skin_types/1.json
  def show
  end

  # GET /skin_types/new
  def new
    @skin_type = SkinType.new
  end

  # GET /skin_types/1/edit
  def edit
  end

  # POST /skin_types or /skin_types.json
  def create
    @skin_type = SkinType.new(skin_type_params)

    respond_to do |format|
      if @skin_type.save
        format.html { redirect_to @skin_type, notice: "Skin type was successfully created." }
        format.json { render :show, status: :created, location: @skin_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @skin_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skin_types/1 or /skin_types/1.json
  def update
    respond_to do |format|
      if @skin_type.update(skin_type_params)
        format.html { redirect_to @skin_type, notice: "Skin type was successfully updated." }
        format.json { render :show, status: :ok, location: @skin_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @skin_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skin_types/1 or /skin_types/1.json
  def destroy
    @skin_type.destroy
    respond_to do |format|
      format.html { redirect_to skin_types_url, notice: "Skin type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skin_type
      @skin_type = SkinType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def skin_type_params
      params.require(:skin_type).permit(:name)
    end
end
