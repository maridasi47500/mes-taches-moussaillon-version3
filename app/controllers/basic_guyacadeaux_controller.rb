class BasicGuyacadeauxController < ApplicationController
  before_action :set_basic_guyacadeau, only: %i[ show edit update destroy ]

  # GET /basic_guyacadeaux or /basic_guyacadeaux.json
def createguya
@basic_guyacadeau=BasicGuyacadeau.new(basic_guyacadeau_params)
render :new
end
def person
@people=Person.findbyid(params[:id])
render layout: false
end
def address
@address=Address.find(params[:id])
render layout: false
end
  def index
    @basic_guyacadeaux = BasicGuyacadeau.all
  end

  # GET /basic_guyacadeaux/1 or /basic_guyacadeaux/1.json
  def show
  end

  # GET /basic_guyacadeaux/new
  def new
    @basic_guyacadeau = BasicGuyacadeau.new
  end

  # GET /basic_guyacadeaux/1/edit
  def edit
  end

  # POST /basic_guyacadeaux or /basic_guyacadeaux.json
  def create
    @basic_guyacadeau = BasicGuyacadeau.new(basic_guyacadeau_params)

    respond_to do |format|
      if @basic_guyacadeau.save
        format.html { redirect_to @basic_guyacadeau, notice: "Basic guyacadeau was successfully created." }
        format.json { render :show, status: :created, location: @basic_guyacadeau }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @basic_guyacadeau.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /basic_guyacadeaux/1 or /basic_guyacadeaux/1.json
  def update
    respond_to do |format|
      if @basic_guyacadeau.update(basic_guyacadeau_params)
        format.html { redirect_to @basic_guyacadeau, notice: "Basic guyacadeau was successfully updated." }
        format.json { render :show, status: :ok, location: @basic_guyacadeau }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @basic_guyacadeau.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /basic_guyacadeaux/1 or /basic_guyacadeaux/1.json
  def destroy
    @basic_guyacadeau.destroy
    respond_to do |format|
      format.html { redirect_to basic_guyacadeaux_url, notice: "Basic guyacadeau was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basic_guyacadeau
      @basic_guyacadeau = BasicGuyacadeau.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def basic_guyacadeau_params
      params.require(:basic_guyacadeau).permit(:address_id, :person_id, :price,:address_attributes=>{})
    end
end
