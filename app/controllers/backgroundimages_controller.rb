class BackgroundimagesController < ApplicationController
  before_action :set_backgroundimage, only: %i[ show edit update destroy ]

  # GET /backgroundimages or /backgroundimages.json
  def index
    @backgroundimages = Backgroundimage.all
  end

  # GET /backgroundimages/1 or /backgroundimages/1.json
  def show
  end

  # GET /backgroundimages/new
  def new
    @backgroundimage = Backgroundimage.new
  end

  # GET /backgroundimages/1/edit
  def edit
  end

  # POST /backgroundimages or /backgroundimages.json
  def create
    @backgroundimage = Backgroundimage.new(backgroundimage_params)

    respond_to do |format|
      if params[:edit] && @backgroundimage.save
        format.html { redirect_to edit_backgroundimage_path(@backgroundimage.id), notice: "Backgroundimage was successfully created." }
        format.json { render :show, status: :created, location: @backgroundimage }
      elsif @backgroundimage.save
        format.html { redirect_to @backgroundimage, notice: "Backgroundimage was successfully created." }
        format.json { render :show, status: :created, location: @backgroundimage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @backgroundimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backgroundimages/1 or /backgroundimages/1.json
  def update
    respond_to do |format|
      if params[:edit] && @backgroundimage.update(backgroundimage_params)
        format.html { redirect_to edit_backgroundimage_path(@backgroundimage.id), notice: "Backgroundimage was successfully updated." }
        format.json { render :show, status: :created, location: @backgroundimage }

      elsif @backgroundimage.update(backgroundimage_params)
        format.html { redirect_to @backgroundimage.url, notice: "Backgroundimage was successfully updated." }
        format.json { render :show, status: :ok, location: @backgroundimage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @backgroundimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backgroundimages/1 or /backgroundimages/1.json
  def destroy
    @backgroundimage.destroy
    respond_to do |format|
      format.html { redirect_to backgroundimages_url, notice: "Backgroundimage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backgroundimage
      @backgroundimage = Backgroundimage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def backgroundimage_params
      params.require(:backgroundimage).permit(:image, :url, :mytype)
    end
end
