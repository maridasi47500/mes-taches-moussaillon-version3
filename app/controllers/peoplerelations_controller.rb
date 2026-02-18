class PeoplerelationsController < ApplicationController
  before_action :set_peoplerelation, only: %i[ show edit update destroy ]

  # GET /peoplerelations or /peoplerelations.json
  def index
    @peoplerelations = Peoplerelation.all
  end

  # GET /peoplerelations/1 or /peoplerelations/1.json
  def show
  end

  # GET /peoplerelations/new
  def new
    @peoplerelation = Peoplerelation.new
  end

  # GET /peoplerelations/1/edit
  def edit
  end
def json
@rel=Peoplerelation.findbyname(params[:name])
render json: @rel
end

  # POST /peoplerelations or /peoplerelations.json
  def create
    @peoplerelation = Peoplerelation.new(peoplerelation_params)

    respond_to do |format|
      if @peoplerelation.save
        format.html { redirect_to @peoplerelation, notice: "Peoplerelation was successfully created." }
        format.json { render :show, status: :created, location: @peoplerelation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @peoplerelation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /peoplerelations/1 or /peoplerelations/1.json
  def update
    respond_to do |format|
      if @peoplerelation.update(peoplerelation_params)
        format.html { redirect_to @peoplerelation, notice: "Peoplerelation was successfully updated." }
        format.json { render :show, status: :ok, location: @peoplerelation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @peoplerelation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peoplerelations/1 or /peoplerelations/1.json
  def destroy
    @peoplerelation.destroy
    respond_to do |format|
      format.html { redirect_to peoplerelations_url, notice: "Peoplerelation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peoplerelation
      @peoplerelation = Peoplerelation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def peoplerelation_params
      params.require(:peoplerelation).permit(:name)
    end
end
