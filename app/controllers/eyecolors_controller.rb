class EyecolorsController < ApplicationController
  before_action :set_eyecolor, only: %i[ show edit update destroy ]

  # GET /eyecolors or /eyecolors.json
  def index
    @eyecolors = Eyecolor.all
  end

  # GET /eyecolors/1 or /eyecolors/1.json
  def show
  end

  # GET /eyecolors/new
  def new
    @eyecolor = Eyecolor.new
  end

  # GET /eyecolors/1/edit
  def edit
  end

  # POST /eyecolors or /eyecolors.json
  def create
    @eyecolor = Eyecolor.new(eyecolor_params)

    respond_to do |format|
      if @eyecolor.save
        format.html { redirect_to @eyecolor, notice: "Eyecolor was successfully created." }
        format.json { render :show, status: :created, location: @eyecolor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @eyecolor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eyecolors/1 or /eyecolors/1.json
  def update
    respond_to do |format|
      if @eyecolor.update(eyecolor_params)
        format.html { redirect_to @eyecolor, notice: "Eyecolor was successfully updated." }
        format.json { render :show, status: :ok, location: @eyecolor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @eyecolor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eyecolors/1 or /eyecolors/1.json
  def destroy
    @eyecolor.destroy
    respond_to do |format|
      format.html { redirect_to eyecolors_url, notice: "Eyecolor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eyecolor
      @eyecolor = Eyecolor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def eyecolor_params
      params.require(:eyecolor).permit(:name)
    end
end
