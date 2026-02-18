class SecretoccupationsController < ApplicationController
  before_action :set_secretoccupation, only: %i[ show edit update destroy ]
  layout false, only: [:places,:people,:aliases]
  def aliases
    @person=Person.find(params[:id])
    @alias=Alias.find_or_create_by(user: current_user,alias: @person)
    @aliases=Alias.where(id: @alias.id)
  end
  def places
    @places=Place.findbyid(params[:id])
  end
  def people
    @people=Person.findbyid(params[:id])
  end
  # GET /secretoccupations or /secretoccupations.json
  def index
    @secretoccupations = Secretoccupation.all
  end

  # GET /secretoccupations/1 or /secretoccupations/1.json
  def show
  end

  # GET /secretoccupations/new
  def new
    @secretoccupation = Secretoccupation.new
  end

  # GET /secretoccupations/1/edit
  def edit
  end

  # POST /secretoccupations or /secretoccupations.json
  def create
    @secretoccupation = Secretoccupation.new(secretoccupation_params)

    respond_to do |format|
      if @secretoccupation.save
        format.html { redirect_to @secretoccupation.aboutsomeonegossip, notice: "gossip was successfully commented." }
        format.json { render :show, status: :created, location: @secretoccupation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @secretoccupation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /secretoccupations/1 or /secretoccupations/1.json
  def update
    respond_to do |format|
      if @secretoccupation.update(secretoccupation_params)
        format.html { redirect_to @secretoccupation, notice: "Secretoccupation was successfully updated." }
        format.json { render :show, status: :ok, location: @secretoccupation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @secretoccupation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /secretoccupations/1 or /secretoccupations/1.json
  def destroy
    @secretoccupation.destroy
    respond_to do |format|
      format.html { redirect_to secretoccupations_url, notice: "Secretoccupation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_secretoccupation
      @secretoccupation = Secretoccupation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def secretoccupation_params
      params.require(:secretoccupation).permit(:alias_id,:aboutsomeonegossip_id,:content_fr, :content_en, :content_de,:person_ids=>[],:place_ids=>[])
    end
end
