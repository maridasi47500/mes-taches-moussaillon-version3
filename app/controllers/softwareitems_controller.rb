class SoftwareitemsController < ApplicationController
  before_action :set_softwareitem, only: %i[ show edit update destroy ]

  # GET /softwareitems or /softwareitems.json
  def index
    @softwareitems = Softwareitem.all
  end

  # GET /softwareitems/1 or /softwareitems/1.json
  def show
  end

  # GET /softwareitems/new
  def new
    @softwareitem = Softwareitem.new
  end

  # GET /softwareitems/1/edit
  def edit
  end

  # POST /softwareitems or /softwareitems.json
  def create
    @softwareitem = Softwareitem.new(softwareitem_params)

    respond_to do |format|
      if @softwareitem.save
        format.html { redirect_to @softwareitem, notice: "Softwareitem was successfully created." }
        format.json { render :show, status: :created, location: @softwareitem }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @softwareitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /softwareitems/1 or /softwareitems/1.json
  def update
    respond_to do |format|
      if @softwareitem.update(softwareitem_params)
        format.html { redirect_to @softwareitem, notice: "Softwareitem was successfully updated." }
        format.json { render :show, status: :ok, location: @softwareitem }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @softwareitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /softwareitems/1 or /softwareitems/1.json
  def destroy
    @softwareitem.destroy
    respond_to do |format|
      format.html { redirect_to softwareitems_url, notice: "Softwareitem was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_softwareitem
      @softwareitem = Softwareitem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def softwareitem_params
      params.require(:softwareitem).permit(:name, :image)
    end
end
