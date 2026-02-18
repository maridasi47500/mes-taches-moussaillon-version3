class BarcriteriaController < ApplicationController
  before_action :set_barcriterion, only: %i[ show edit update destroy ]

  # GET /barcriteria or /barcriteria.json
  def json
    @barcriteria = Barcriterion.findbyname(params[:name])
    render json: @barcriteria
  end
  def index
    @barcriteria = Barcriterion.all
  end

  # GET /barcriteria/1 or /barcriteria/1.json
  def show
  end

  # GET /barcriteria/new
  def new
    @barcriterion = Barcriterion.new(bar_id: params[:barid])
  end

  # GET /barcriteria/1/edit
  def edit
  end

  # POST /barcriteria or /barcriteria.json
  def create
    @barcriterion = Barcriterion.new(barcriterion_params)

    respond_to do |format|
      if @barcriterion.save
        format.html { redirect_to @barcriterion, notice: "Barcriterion was successfully created." }
        format.json { render :show, status: :created, location: @barcriterion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @barcriterion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barcriteria/1 or /barcriteria/1.json
  def update
    respond_to do |format|
      if @barcriterion.update(barcriterion_params)
        format.html { redirect_to @barcriterion, notice: "Barcriterion was successfully updated." }
        format.json { render :show, status: :ok, location: @barcriterion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @barcriterion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barcriteria/1 or /barcriteria/1.json
  def destroy
    @barcriterion.destroy
    respond_to do |format|
      format.html { redirect_to barcriteria_url, notice: "Barcriterion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barcriterion
      @barcriterion = Barcriterion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def barcriterion_params
      params.require(:barcriterion).permit(:description, :gooduser_id, :bar_id)
    end
end
