class SkinColorsController < ApplicationController
  before_action :set_skin_color, only: %i[ show edit update destroy ]

  # GET /skin_colors or /skin_colors.json
  def index
    @skin_colors = SkinColor.all
  end

  # GET /skin_colors/1 or /skin_colors/1.json
  def show
  end

  # GET /skin_colors/new
  def new
    @skin_color = SkinColor.new
  end

  # GET /skin_colors/1/edit
  def edit
  end

  # POST /skin_colors or /skin_colors.json
  def create
    @skin_color = SkinColor.new(skin_color_params)

    respond_to do |format|
      if @skin_color.save
        format.html { redirect_to @skin_color, notice: "Skin color was successfully created." }
        format.json { render :show, status: :created, location: @skin_color }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @skin_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skin_colors/1 or /skin_colors/1.json
  def update
    respond_to do |format|
      if @skin_color.update(skin_color_params)
        format.html { redirect_to @skin_color, notice: "Skin color was successfully updated." }
        format.json { render :show, status: :ok, location: @skin_color }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @skin_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skin_colors/1 or /skin_colors/1.json
  def destroy
    @skin_color.destroy
    respond_to do |format|
      format.html { redirect_to skin_colors_url, notice: "Skin color was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skin_color
      @skin_color = SkinColor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def skin_color_params
      params.require(:skin_color).permit(:name)
    end
end
