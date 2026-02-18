class CitymayorsController < ApplicationController
  before_action :set_citymayor, only: %i[ show edit update destroy ]
  def city
	@cities=City.findbyid(params[:id])
	render layout: false
  end
  def people
	@people=Person.findbyid(params[:id])
	render layout: false
  end
  # GET /citymayors or /citymayors.json
  def index
    @citymayors = Citymayor.all
  end

  # GET /citymayors/1 or /citymayors/1.json
  def show
    @citynews = @citymayor.city.citynews
  end

  # GET /citymayors/new
  def new
    @citymayor = Citymayor.new(user_id:current_user.id)
  end

  # GET /citymayors/1/edit
  def edit
  end

  # POST /citymayors or /citymayors.json
  def create
    @citymayor = Citymayor.new(citymayor_params)

    respond_to do |format|
      if @citymayor.save
        format.html { redirect_to @citymayor, notice: "Citymayor was successfully created." }
        format.json { render :show, status: :created, location: @citymayor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @citymayor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citymayors/1 or /citymayors/1.json
  def update
    respond_to do |format|
      if @citymayor.update(citymayor_params)
        format.html { redirect_to @citymayor, notice: "Citymayor was successfully updated." }
        format.json { render :show, status: :ok, location: @citymayor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @citymayor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citymayors/1 or /citymayors/1.json
  def destroy
    @citymayor.destroy
    respond_to do |format|
      format.html { redirect_to citymayors_url, notice: "Citymayor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_citymayor
      @citymayor = Citymayor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def citymayor_params
      params.require(:citymayor).permit(:person_id,:user_id,:city_id,:mot)

    end
end
