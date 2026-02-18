class WinningattitudesController < ApplicationController
  before_action :set_winningattitude, only: %i[ show edit update destroy ]

  # GET /winningattitudes or /winningattitudes.json
  layout false, only: [:people]
  def json
    @winningattitudes=Winningattitude.findbyname(params[:name])
    render json: @winningattitudes
  end
  def people
    @people=Person.findbyid(params[:id])
  end
  def index
    @winningattitudes = Winningattitude.all
  end

  # GET /winningattitudes/1 or /winningattitudes/1.json
  def show
  end

  # GET /winningattitudes/new
  def new
    @winningattitude = Winningattitude.new
  end

  # GET /winningattitudes/1/edit
  def edit
  end

  # POST /winningattitudes or /winningattitudes.json
  def create
    @winningattitude = Winningattitude.new(winningattitude_params)

    respond_to do |format|
      if @winningattitude.save
        format.html { redirect_to @winningattitude, notice: "Winningattitude was successfully created." }
        format.json { render :show, status: :created, location: @winningattitude }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @winningattitude.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /winningattitudes/1 or /winningattitudes/1.json
  def update
    respond_to do |format|
      if @winningattitude.update(winningattitude_params)
        format.html { redirect_to @winningattitude, notice: "Winningattitude was successfully updated." }
        format.json { render :show, status: :ok, location: @winningattitude }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @winningattitude.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /winningattitudes/1 or /winningattitudes/1.json
  def destroy
    @winningattitude.destroy
    respond_to do |format|
      format.html { redirect_to winningattitudes_url, notice: "Winningattitude was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_winningattitude
      @winningattitude = Winningattitude.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def winningattitude_params
      params.require(:winningattitude).permit(:content_fr, :content_en, :content_de,:person_ids=>[])
    end
end
