class CompanieshaveemployeesController < ApplicationController
  before_action :set_companieshaveemployee, only: %i[ show edit update destroy ]

layout false, only: [:employee,:employer,:nationality,:job,:company]
  # GET /companieshaveemployees or /companieshaveemployees.json
  def index
    @companieshaveemployees = Companieshaveemployee.all
  end

  # GET /companieshaveemployees/1 or /companieshaveemployees/1.json
  def show
  end

  # GET /companieshaveemployees/new
  def new
    @companieshaveemployee = Companieshaveemployee.new(user: current_user)
  end

  # GET /companieshaveemployees/1/edit
  def edit
  end

  # POST /companieshaveemployees or /companieshaveemployees.json
  def create
    @companieshaveemployee = Companieshaveemployee.new(companieshaveemployee_params)

    respond_to do |format|
      if @companieshaveemployee.save
        format.html { redirect_to @companieshaveemployee, notice: "Companieshaveemployee was successfully created." }
        format.json { render :show, status: :created, location: @companieshaveemployee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @companieshaveemployee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companieshaveemployees/1 or /companieshaveemployees/1.json
  def update
    respond_to do |format|
      if @companieshaveemployee.update(companieshaveemployee_params)
        format.html { redirect_to @companieshaveemployee, notice: "Companieshaveemployee was successfully updated." }
        format.json { render :show, status: :ok, location: @companieshaveemployee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @companieshaveemployee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companieshaveemployees/1 or /companieshaveemployees/1.json
  def destroy
    @companieshaveemployee.destroy
    respond_to do |format|
      format.html { redirect_to companieshaveemployees_url, notice: "Companieshaveemployee was successfully destroyed." }
      format.json { head :no_content }
    end
  end
def employee
@employees=Person.findbyid(params[:id])
end
def employer
@employers=Person.findbyid(params[:id])
end
def job
@jobs=Job.findbyid(params[:id])
end
def company
@companies=Company.findbyid(params[:id])
end
def nationality
@nationalities=Nationality.findbyid(params[:id])
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_companieshaveemployee
      @companieshaveemployee = Companieshaveemployee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def companieshaveemployee_params
      params.require(:companieshaveemployee).permit(:employee_id, :employer_id, :job_id, :company_id, :user_id,:nationality_id)
    end
end
