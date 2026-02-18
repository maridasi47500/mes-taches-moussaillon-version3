class FaceshapesController < ApplicationController
  before_action :set_faceshape, only: %i[ show edit update destroy ]

  # GET /faceshapes or /faceshapes.json
  def index
    @faceshapes = Faceshape.all
  end

  # GET /faceshapes/1 or /faceshapes/1.json
  def show
  end

  # GET /faceshapes/new
  def new
    @faceshape = Faceshape.new
  end

  # GET /faceshapes/1/edit
  def edit
  end

  # POST /faceshapes or /faceshapes.json
  def create
    @faceshape = Faceshape.new(faceshape_params)

    respond_to do |format|
      if @faceshape.save
        format.html { redirect_to @faceshape, notice: "Faceshape was successfully created." }
        format.json { render :show, status: :created, location: @faceshape }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @faceshape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faceshapes/1 or /faceshapes/1.json
  def update
    respond_to do |format|
      if @faceshape.update(faceshape_params)
        format.html { redirect_to @faceshape, notice: "Faceshape was successfully updated." }
        format.json { render :show, status: :ok, location: @faceshape }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @faceshape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faceshapes/1 or /faceshapes/1.json
  def destroy
    @faceshape.destroy
    respond_to do |format|
      format.html { redirect_to faceshapes_url, notice: "Faceshape was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faceshape
      @faceshape = Faceshape.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def faceshape_params
      params.require(:faceshape).permit(:name)
    end
end
