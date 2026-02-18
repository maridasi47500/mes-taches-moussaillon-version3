class MusicalbumsController < ApplicationController
  before_action :set_musicalbum, only: %i[ show edit update destroy ]

  # GET /musicalbums or /musicalbums.json
  def index
    @musicalbums = Musicalbum.all
  end

  # GET /musicalbums/1 or /musicalbums/1.json
  def show
  end

  # GET /musicalbums/new
  def new
    @musicalbum = Musicalbum.new
  end

  # GET /musicalbums/1/edit
  def edit
  end

  # POST /musicalbums or /musicalbums.json
  def create
    @musicalbum = Musicalbum.new(musicalbum_params)

    respond_to do |format|
      if @musicalbum.save
        format.html { redirect_to @musicalbum, notice: "Musicalbum was successfully created." }
        format.json { render :show, status: :created, location: @musicalbum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @musicalbum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /musicalbums/1 or /musicalbums/1.json
  def update
    respond_to do |format|
      if @musicalbum.update(musicalbum_params)
        format.html { redirect_to @musicalbum, notice: "Musicalbum was successfully updated." }
        format.json { render :show, status: :ok, location: @musicalbum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @musicalbum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /musicalbums/1 or /musicalbums/1.json
  def destroy
    @musicalbum.destroy
    respond_to do |format|
      format.html { redirect_to musicalbums_url, notice: "Musicalbum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_musicalbum
      @musicalbum = Musicalbum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def musicalbum_params
      params.require(:musicalbum).permit(:name, :image)
    end
end
