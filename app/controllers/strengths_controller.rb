class StrengthsController < ApplicationController
  before_action :set_strength, only: %i[ show edit update destroy ]

def json
@j=Strength.findbyname(params[:name])
render json: @j
end
  # GET /strengths or /strengths.json
  def index
    @strengths = Strength.all
  end

  # GET /strengths/1 or /strengths/1.json
  def show
  end

  # GET /strengths/new
  def new
    @strength = Strength.new
  end

  # GET /strengths/1/edit
  def edit
  end

  # POST /strengths or /strengths.json
  def create
    @strength = Strength.new(strength_params)

    respond_to do |format|
      if @strength.save
        format.html { redirect_to @strength, notice: "Strength was successfully created." }
        format.json { render :show, status: :created, location: @strength }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @strength.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /strengths/1 or /strengths/1.json
  def update
    respond_to do |format|
      if @strength.update(strength_params)
        format.html { redirect_to @strength, notice: "Strength was successfully updated." }
        format.json { render :show, status: :ok, location: @strength }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @strength.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /strengths/1 or /strengths/1.json
  def destroy
    @strength.destroy
    respond_to do |format|
      format.html { redirect_to strengths_url, notice: "Strength was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_strength
      @strength = Strength.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def strength_params
      params.require(:strength).permit(:name_en, :name_fr, :name_de)
    end
end
