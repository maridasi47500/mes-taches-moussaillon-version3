class TendancesController < ApplicationController
  before_action :set_tendance, only: %i[ show edit update destroy ]

  # GET /tendances or /tendances.json
  def index
    @tendances = Tendance.all
  end

  # GET /tendances/1 or /tendances/1.json
  def show
  end

  # GET /tendances/new
  def new
    @tendance = Tendance.new
  end

  # GET /tendances/1/edit
  def edit
  end

  # POST /tendances or /tendances.json
  def create
    @tendance = Tendance.new(tendance_params)

    respond_to do |format|
      if @tendance.save
        format.html { redirect_to @tendance, notice: "Tendance was successfully created." }
        format.json { render :show, status: :created, location: @tendance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tendances/1 or /tendances/1.json
  def update
    respond_to do |format|
      if @tendance.update(tendance_params)
        format.html { redirect_to @tendance, notice: "Tendance was successfully updated." }
        format.json { render :show, status: :ok, location: @tendance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tendances/1 or /tendances/1.json
  def destroy
    @tendance.destroy
    respond_to do |format|
      format.html { redirect_to tendances_url, notice: "Tendance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tendance
      @tendance = Tendance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tendance_params
      params.require(:tendance).permit(:content)
    end
end
