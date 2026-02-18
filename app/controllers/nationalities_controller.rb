class NationalitiesController < ApplicationController
  before_action :set_nationality, only: %i[ show edit update destroy ]
  def people
    @people=Person.findbyid(params[:id])
render layout: false
  end
def json
@j=Nationality.findbyname(params[:name])
render json: @j
end


  # GET /nationalities or /nationalities.json
  def index
    @nationalities = Nationality.all
  end

  # GET /nationalities/1 or /nationalities/1.json
  def show
  end

  # GET /nationalities/new
  def new
    @nationality = Nationality.new
  end

  # GET /nationalities/1/edit
  def edit
  end

  # POST /nationalities or /nationalities.json
  def create
    @nationality = Nationality.new(nationality_params)

    respond_to do |format|
      if @nationality.save
        format.html { redirect_to @nationality, notice: "Nationality was successfully created." }
        format.json { render :show, status: :created, location: @nationality }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nationality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nationalities/1 or /nationalities/1.json
  def update
    respond_to do |format|
      if @nationality.update(nationality_params)
        format.html { redirect_to @nationality, notice: "Nationality was successfully updated." }
        format.json { render :show, status: :ok, location: @nationality }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nationality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nationalities/1 or /nationalities/1.json
  def destroy
    @nationality.destroy
    respond_to do |format|
      format.html { redirect_to nationalities_url, notice: "Nationality was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nationality
      @nationality = Nationality.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nationality_params
      params.require(:nationality).permit(:flagicon,:name_en, :name_fr, :name_de,:person_ids=>[])
    end
end
