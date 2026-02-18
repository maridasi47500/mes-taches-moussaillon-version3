class PeoplecarsController < ApplicationController
  before_action :set_peoplecar, only: %i[ show edit update destroy ]

  # GET /peoplecars or /peoplecars.json
  def index
    @peoplecars = Peoplecar.all
  end

  # GET /peoplecars/1 or /peoplecars/1.json
  def show
  end

  # GET /peoplecars/new
  def new
    @peoplecar = Peoplecar.new
  end

  # GET /peoplecars/1/edit
  def edit
  end

  # POST /peoplecars or /peoplecars.json
  def create
    @peoplecar = Peoplecar.new(peoplecar_params)

    respond_to do |format|
      if @peoplecar.save
        format.html { redirect_to @peoplecar, notice: "Peoplecar was successfully created." }
        format.json { render :show, status: :created, location: @peoplecar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @peoplecar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /peoplecars/1 or /peoplecars/1.json
  def update
    respond_to do |format|
      if @peoplecar.update(peoplecar_params)
        format.html { redirect_to car_peoplecar_path(@peoplecar.id, car_id: @peoplecar.car_id), notice: "Peoplecar was successfully updated." }
        format.json { render :show, status: :ok, location: @peoplecar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @peoplecar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peoplecars/1 or /peoplecars/1.json
  def destroy
    @peoplecar.destroy
    respond_to do |format|
      format.html { redirect_to peoplecars_url, notice: "Peoplecar was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peoplecar
      @peoplecar = Peoplecar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def peoplecar_params
      params.require(:peoplecar).permit(:person_id, :car_id, :user_id,:myphotos=>[])
    end
end
