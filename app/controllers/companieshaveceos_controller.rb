class CompanieshaveceosController < ApplicationController
  before_action :set_companieshaveceo, only: %i[ show edit update destroy ]

layout false, only:[:ceo,:job,:company,:nationality]
  # GET /companieshaveceos or /companieshaveceos.json
  def index
    @companieshaveceos = Companieshaveceo.all
  end

  # GET /companieshaveceos/1 or /companieshaveceos/1.json
  def show
  end

  # GET /companieshaveceos/new
  def new
    @companieshaveceo = Companieshaveceo.new(user: current_user)
  end

  # GET /companieshaveceos/1/edit
  def edit
  end

  # POST /companieshaveceos or /companieshaveceos.json
  def create
    @companieshaveceo = Companieshaveceo.new(companieshaveceo_params)

    respond_to do |format|
      if @companieshaveceo.save
        format.html { redirect_to @companieshaveceo, notice: "Companieshaveceo was successfully created." }
        format.json { render :show, status: :created, location: @companieshaveceo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @companieshaveceo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companieshaveceos/1 or /companieshaveceos/1.json
  def update
    respond_to do |format|
      if @companieshaveceo.update(companieshaveceo_params)
        format.html { redirect_to @companieshaveceo, notice: "Companieshaveceo was successfully updated." }
        format.json { render :show, status: :ok, location: @companieshaveceo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @companieshaveceo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companieshaveceos/1 or /companieshaveceos/1.json
def job
@jobs=Job.findbyid(params[:id])
end
def ceo
@ceos=Person.findbyid(params[:id])
end
def company
@companies=Company.findbyid(params[:id])
end
  def destroy
    @companieshaveceo.destroy
    respond_to do |format|
      format.html { redirect_to companieshaveceos_url, notice: "Companieshaveceo was successfully destroyed." }
      format.json { head :no_content }
    end
  end
def nationality
@nationalities=Nationality.findbyid(params[:id])
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_companieshaveceo
      @companieshaveceo = Companieshaveceo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def companieshaveceo_params
      params.require(:companieshaveceo).permit(:ceo_id, :job_id, :company_id, :user_id,:nationality_id)
    end
end
