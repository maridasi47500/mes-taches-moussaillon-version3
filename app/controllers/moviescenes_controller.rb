class MoviescenesController < ApplicationController
  before_action :set_moviescene, only: %i[ show edit update destroy ]

  # GET /moviescenes or /moviescenes.json
  def index
    @moviescenes = Moviescene.all
  end

  # GET /moviescenes/1 or /moviescenes/1.json
  def show
  end

  # GET /moviescenes/new
  def new
    @moviescene = Moviescene.new
  end

  # GET /moviescenes/1/edit
  def edit
  end

  # POST /moviescenes or /moviescenes.json
  def create
    @moviescene = Moviescene.new(moviescene_params)

    respond_to do |format|
      if @moviescene.save
        format.html { redirect_to @moviescene, notice: "Moviescene was successfully created." }
        format.json { render :show, status: :created, location: @moviescene }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @moviescene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moviescenes/1 or /moviescenes/1.json
  def update
    respond_to do |format|
      if @moviescene.update(moviescene_params)
        format.html { redirect_to @moviescene, notice: "Moviescene was successfully updated." }
        format.json { render :show, status: :ok, location: @moviescene }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @moviescene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moviescenes/1 or /moviescenes/1.json
  def destroy
    @moviescene.destroy
    respond_to do |format|
      format.html { redirect_to moviescenes_url, notice: "Moviescene was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moviescene
      @moviescene = Moviescene.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def moviescene_params
      params.require(:moviescene).permit(:title, :description)
    end
end
