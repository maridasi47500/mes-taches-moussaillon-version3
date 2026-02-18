class HaircolorsController < ApplicationController
  before_action :set_haircolor, only: %i[ show edit update destroy ]

  # GET /haircolors or /haircolors.json
  def index
    @haircolors = Haircolor.all
  end

  # GET /haircolors/1 or /haircolors/1.json
  def show
  end

  # GET /haircolors/new
  def new
    @haircolor = Haircolor.new
  end

  # GET /haircolors/1/edit
  def edit
  end

  # POST /haircolors or /haircolors.json
  def create
    @haircolor = Haircolor.new(haircolor_params)

    respond_to do |format|
      if @haircolor.save
        format.html { redirect_to @haircolor, notice: "Haircolor was successfully created." }
        format.json { render :show, status: :created, location: @haircolor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @haircolor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /haircolors/1 or /haircolors/1.json
  def update
    respond_to do |format|
      if @haircolor.update(haircolor_params)
        format.html { redirect_to @haircolor, notice: "Haircolor was successfully updated." }
        format.json { render :show, status: :ok, location: @haircolor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @haircolor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /haircolors/1 or /haircolors/1.json
  def destroy
    @haircolor.destroy
    respond_to do |format|
      format.html { redirect_to haircolors_url, notice: "Haircolor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_haircolor
      @haircolor = Haircolor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def haircolor_params
      params.require(:haircolor).permit(:name)
    end
end
