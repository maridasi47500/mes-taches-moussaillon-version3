class HardwareitemsController < ApplicationController
  before_action :set_hardwareitem, only: %i[ show edit update destroy ]

  # GET /hardwareitems or /hardwareitems.json
  def index
    @hardwareitems = Hardwareitem.all
  end

  # GET /hardwareitems/1 or /hardwareitems/1.json
  def show
  end

  # GET /hardwareitems/new
  def new
    @hardwareitem = Hardwareitem.new
  end

  # GET /hardwareitems/1/edit
  def edit
  end

  # POST /hardwareitems or /hardwareitems.json
  def create
    @hardwareitem = Hardwareitem.new(hardwareitem_params)

    respond_to do |format|
      if @hardwareitem.save
        format.html { redirect_to @hardwareitem, notice: "Hardwareitem was successfully created." }
        format.json { render :show, status: :created, location: @hardwareitem }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hardwareitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hardwareitems/1 or /hardwareitems/1.json
  def update
    respond_to do |format|
      if @hardwareitem.update(hardwareitem_params)
        format.html { redirect_to @hardwareitem, notice: "Hardwareitem was successfully updated." }
        format.json { render :show, status: :ok, location: @hardwareitem }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hardwareitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hardwareitems/1 or /hardwareitems/1.json
  def destroy
    @hardwareitem.destroy
    respond_to do |format|
      format.html { redirect_to hardwareitems_url, notice: "Hardwareitem was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hardwareitem
      @hardwareitem = Hardwareitem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hardwareitem_params
      params.require(:hardwareitem).permit(:name, :image)
    end
end
