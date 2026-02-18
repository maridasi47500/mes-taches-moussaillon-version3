class SpouselinksController < ApplicationController
  before_action :set_spouselink, only: %i[ show edit update destroy ]

def json
@s = Spouselink.findbyname(params[:name])
render json: @s
end
  # GET /spouselinks or /spouselinks.json
  def index
    @spouselinks = Spouselink.all
  end

  # GET /spouselinks/1 or /spouselinks/1.json
  def show
  end

  # GET /spouselinks/new
  def new
    @spouselink = Spouselink.new
  end

  # GET /spouselinks/1/edit
  def edit
  end

  # POST /spouselinks or /spouselinks.json
  def create
    @spouselink = Spouselink.new(spouselink_params)

    respond_to do |format|
      if @spouselink.save
        format.html { redirect_to @spouselink, notice: "Spouselink was successfully created." }
        format.json { render :show, status: :created, location: @spouselink }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spouselink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spouselinks/1 or /spouselinks/1.json
  def update
    respond_to do |format|
      if @spouselink.update(spouselink_params)
        format.html { redirect_to @spouselink, notice: "Spouselink was successfully updated." }
        format.json { render :show, status: :ok, location: @spouselink }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spouselink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spouselinks/1 or /spouselinks/1.json
  def destroy
    @spouselink.destroy
    respond_to do |format|
      format.html { redirect_to spouselinks_url, notice: "Spouselink was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spouselink
      @spouselink = Spouselink.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spouselink_params
      params.require(:spouselink).permit(:name_en, :name_fr, :name_de)
    end
end
