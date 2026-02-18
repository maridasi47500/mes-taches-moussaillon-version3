class ClothesController < ApplicationController
  before_action :set_clothing, only: %i[ show edit update destroy ]
  layout false, only: [:aliases]
  def aliases
   @aliases=Alias.findorcreatefrompersoniduser(params[:id],current_user)
  end
  def json						    
    @clothes=Clothing.findbyname(params[:name])		    
    render json: @clothes				    
    							    
  end							     

  # GET /clothes or /clothes.json
  def index
    @clothes = Clothing.all
  end

  # GET /clothes/1 or /clothes/1.json
  def show
  end

  # GET /clothes/new
  def new
    @clothing = Clothing.new
  end

  # GET /clothes/1/edit
  def edit
  end

  # POST /clothes or /clothes.json
  def create
    @clothing = Clothing.new(clothing_params)

    respond_to do |format|
      if @clothing.save
        format.html { redirect_to @clothing, notice: "Clothing was successfully created." }
        format.json { render :show, status: :created, location: @clothing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @clothing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clothes/1 or /clothes/1.json
  def update
    respond_to do |format|
      if @clothing.update(clothing_params)
        format.html { redirect_to @clothing, notice: "Clothing was successfully updated." }
        format.json { render :show, status: :ok, location: @clothing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @clothing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clothes/1 or /clothes/1.json
  def destroy
    @clothing.destroy
    respond_to do |format|
      format.html { redirect_to clothes_url, notice: "Clothing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clothing
      @clothing = Clothing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def clothing_params
      params.require(:clothing).permit(:name_en,:name_fr,:name_de, :image,:alias_ids=>[])
    end
end
