class CompanieshavecustomersController < ApplicationController
  before_action :set_companieshavecustomer, only: %i[ show edit update destroy ]
layout false, only:[:employee, :customer,:company,:nationality]

  # GET /companieshavecustomers or /companieshavecustomers.json
  def index
    @companieshavecustomers = Companieshavecustomer.all
  end

  # GET /companieshavecustomers/1 or /companieshavecustomers/1.json
  def show
  end

  # GET /companieshavecustomers/new
  def new
    @companieshavecustomer = Companieshavecustomer.new(user: current_user)
  end

  # GET /companieshavecustomers/1/edit
  def edit
  end

  # POST /companieshavecustomers or /companieshavecustomers.json
  def create
    @companieshavecustomer = Companieshavecustomer.new(companieshavecustomer_params)

    respond_to do |format|
      if @companieshavecustomer.save
        format.html { redirect_to @companieshavecustomer, notice: "Companieshavecustomer was successfully created." }
        format.json { render :show, status: :created, location: @companieshavecustomer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @companieshavecustomer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companieshavecustomers/1 or /companieshavecustomers/1.json
  def update
    respond_to do |format|
      if @companieshavecustomer.update(companieshavecustomer_params)
        format.html { redirect_to @companieshavecustomer, notice: "Companieshavecustomer was successfully updated." }
        format.json { render :show, status: :ok, location: @companieshavecustomer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @companieshavecustomer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companieshavecustomers/1 or /companieshavecustomers/1.json
  def destroy
    @companieshavecustomer.destroy
    respond_to do |format|
      format.html { redirect_to companieshavecustomers_url, notice: "Companieshavecustomer was successfully destroyed." }
      format.json { head :no_content }
    end
  end
def employee
@employees=Person.findbyid(params[:id])
end
def customer
@customers=Person.findbyid(params[:id])
end
def company
@companies=Company.findbyid(params[:id])
end
def nationality
@nationalities=Nationality.findbyid(params[:id])
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_companieshavecustomer
      @companieshavecustomer = Companieshavecustomer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def companieshavecustomer_params
      params.require(:companieshavecustomer).permit(:employee_id, :customer_id, :user_id, :company_id,:nationality_id)
    end
end
