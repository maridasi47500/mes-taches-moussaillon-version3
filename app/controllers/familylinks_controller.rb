class FamilylinksController < ApplicationController
  before_action :set_familylink, only: %i[ show edit update destroy ]

def json
@s = Familylink.findbyname(params[:name])
render json: @s

end
  # GET /familylinks or /familylinks.json
  def index
    @familylinks = Familylink.all
  end

  # GET /familylinks/1 or /familylinks/1.json
  def show
  end

  # GET /familylinks/new
  def new
    @familylink = Familylink.new
  end

  # GET /familylinks/1/edit
  def edit
  end

  # POST /familylinks or /familylinks.json
  def create
    @familylink = Familylink.new(familylink_params)

    respond_to do |format|
      if @familylink.save
        format.html { redirect_to @familylink, notice: "Familylink was successfully created." }
        format.json { render :show, status: :created, location: @familylink }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @familylink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /familylinks/1 or /familylinks/1.json
  def update
    respond_to do |format|
      if @familylink.update(familylink_params)
        format.html { redirect_to @familylink, notice: "Familylink was successfully updated." }
        format.json { render :show, status: :ok, location: @familylink }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @familylink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /familylinks/1 or /familylinks/1.json
  def destroy
    @familylink.destroy
    respond_to do |format|
      format.html { redirect_to familylinks_url, notice: "Familylink was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_familylink
      @familylink = Familylink.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def familylink_params
      params.require(:familylink).permit(:name_en, :name_fr, :name_de,:image)
    end
end
