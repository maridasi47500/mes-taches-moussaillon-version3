class HairlengthsController < ApplicationController
  before_action :set_hairlength, only: %i[ show edit update destroy ]

  # GET /hairlengths or /hairlengths.json
  def index
    @hairlengths = Hairlength.all
  end

  # GET /hairlengths/1 or /hairlengths/1.json
  def show
  end

  # GET /hairlengths/new
  def new
    @hairlength = Hairlength.new
  end

  # GET /hairlengths/1/edit
  def edit
  end

  # POST /hairlengths or /hairlengths.json
  def create
    @hairlength = Hairlength.new(hairlength_params)

    respond_to do |format|
      if @hairlength.save
        format.html { redirect_to @hairlength, notice: "Hairlength was successfully created." }
        format.json { render :show, status: :created, location: @hairlength }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hairlength.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hairlengths/1 or /hairlengths/1.json
  def update
    respond_to do |format|
      if @hairlength.update(hairlength_params)
        format.html { redirect_to @hairlength, notice: "Hairlength was successfully updated." }
        format.json { render :show, status: :ok, location: @hairlength }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hairlength.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hairlengths/1 or /hairlengths/1.json
  def destroy
    @hairlength.destroy
    respond_to do |format|
      format.html { redirect_to hairlengths_url, notice: "Hairlength was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hairlength
      @hairlength = Hairlength.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hairlength_params
      params.require(:hairlength).permit(:name)
    end
end
