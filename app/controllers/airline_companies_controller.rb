class AirlineCompaniesController < ApplicationController
  before_action :set_airline_company, only: %i[ show edit update destroy ]

  # GET /airline_companies or /airline_companies.json
def json
@g=AirlineCompany.findbyname(params[:name])
render json: @g
end
  def index
    @airline_companies = AirlineCompany.all
  end

  # GET /airline_companies/1 or /airline_companies/1.json
  def show
  end

  # GET /airline_companies/new
  def new
    @airline_company = AirlineCompany.new
  end

  # GET /airline_companies/1/edit
  def edit
  end

  # POST /airline_companies or /airline_companies.json
  def create
    @airline_company = AirlineCompany.new(airline_company_params)

    respond_to do |format|
      if @airline_company.save
        format.html { redirect_to @airline_company, notice: "Airline company was successfully created." }
        format.json { render :show, status: :created, location: @airline_company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @airline_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /airline_companies/1 or /airline_companies/1.json
  def update
    respond_to do |format|
      if @airline_company.update(airline_company_params)
        format.html { redirect_to @airline_company, notice: "Airline company was successfully updated." }
        format.json { render :show, status: :ok, location: @airline_company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @airline_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /airline_companies/1 or /airline_companies/1.json
  def destroy
    @airline_company.destroy
    respond_to do |format|
      format.html { redirect_to airline_companies_url, notice: "Airline company was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_airline_company
      @airline_company = AirlineCompany.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def airline_company_params
      params.require(:airline_company).permit(:name_fr, :name_en, :name_de,:image)
    end
end
