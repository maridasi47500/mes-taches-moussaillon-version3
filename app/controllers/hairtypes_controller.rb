class HairtypesController < ApplicationController
  before_action :set_hairtype, only: %i[ show edit update destroy ]

  # GET /hairtypes or /hairtypes.json
  def index
    @hairtypes = Hairtype.all
  end

  # GET /hairtypes/1 or /hairtypes/1.json
  def show
  end

  # GET /hairtypes/new
  def new
    @hairtype = Hairtype.new
  end

  # GET /hairtypes/1/edit
  def edit
  end

  # POST /hairtypes or /hairtypes.json
  def create
    @hairtype = Hairtype.new(hairtype_params)

    respond_to do |format|
      if @hairtype.save
        format.html { redirect_to @hairtype, notice: "Hairtype was successfully created." }
        format.json { render :show, status: :created, location: @hairtype }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hairtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hairtypes/1 or /hairtypes/1.json
  def update
    respond_to do |format|
      if @hairtype.update(hairtype_params)
        format.html { redirect_to @hairtype, notice: "Hairtype was successfully updated." }
        format.json { render :show, status: :ok, location: @hairtype }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hairtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hairtypes/1 or /hairtypes/1.json
  def destroy
    @hairtype.destroy
    respond_to do |format|
      format.html { redirect_to hairtypes_url, notice: "Hairtype was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hairtype
      @hairtype = Hairtype.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hairtype_params
      params.require(:hairtype).permit(:name)
    end
end
