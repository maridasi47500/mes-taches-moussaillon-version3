class UstensilesController < ApplicationController
  before_action :set_ustensile, only: %i[ show edit update destroy ]

  # GET /ustensiles or /ustensiles.json
  def index
    @ustensiles = Ustensile.all
  end

  # GET /ustensiles/1 or /ustensiles/1.json
  def show
  end

  # GET /ustensiles/new
  def new
    @ustensile = Ustensile.new
  end

  # GET /ustensiles/1/edit
  def edit
  end

  # POST /ustensiles or /ustensiles.json
  def create
    @ustensile = Ustensile.new(ustensile_params)

    respond_to do |format|
      if @ustensile.save
        format.html { redirect_to @ustensile, notice: "Ustensile was successfully created." }
        format.json { render :show, status: :created, location: @ustensile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ustensile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ustensiles/1 or /ustensiles/1.json
  def update
    respond_to do |format|
      if @ustensile.update(ustensile_params)
        format.html { redirect_to @ustensile, notice: "Ustensile was successfully updated." }
        format.json { render :show, status: :ok, location: @ustensile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ustensile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ustensiles/1 or /ustensiles/1.json
  def destroy
    @ustensile.destroy
    respond_to do |format|
      format.html { redirect_to ustensiles_url, notice: "Ustensile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ustensile
      @ustensile = Ustensile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ustensile_params
      params.require(:ustensile).permit(:name, :image)
    end
end
