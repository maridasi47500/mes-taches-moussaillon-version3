class ClothescolorsController < ApplicationController
  before_action :set_clothescolor, only: %i[ show edit update destroy ]

  # GET /clothescolors or /clothescolors.json
  def index
    @clothescolors = Clothescolor.all
  end

  # GET /clothescolors/1 or /clothescolors/1.json
  def show
  end

  # GET /clothescolors/new
  def new
    @clothescolor = Clothescolor.new
  end

  # GET /clothescolors/1/edit
  def edit
  end

  # POST /clothescolors or /clothescolors.json
  def create
    @clothescolor = Clothescolor.new(clothescolor_params)

    respond_to do |format|
      if @clothescolor.save
        format.html { redirect_to @clothescolor, notice: "Clothescolor was successfully created." }
        format.json { render :show, status: :created, location: @clothescolor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @clothescolor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clothescolors/1 or /clothescolors/1.json
  def update
    respond_to do |format|
      if @clothescolor.update(clothescolor_params)
        format.html { redirect_to @clothescolor, notice: "Clothescolor was successfully updated." }
        format.json { render :show, status: :ok, location: @clothescolor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @clothescolor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clothescolors/1 or /clothescolors/1.json
  def destroy
    @clothescolor.destroy
    respond_to do |format|
      format.html { redirect_to clothescolors_url, notice: "Clothescolor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clothescolor
      @clothescolor = Clothescolor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def clothescolor_params
      params.require(:clothescolor).permit(:name)
    end
end
