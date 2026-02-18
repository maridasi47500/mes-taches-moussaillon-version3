class TravelticketsController < ApplicationController
  before_action :set_travelticket, only: %i[ show edit update destroy ]

  layout false, only: [:aliases]
  def aliases
   @aliases=Alias.findorcreatefrompersoniduser(params[:id],current_user)
  end

  # GET /traveltickets or /traveltickets.json
  def index
    @traveltickets = Travelticket.all
  end

  # GET /traveltickets/1 or /traveltickets/1.json
  def show
  end

  # GET /traveltickets/new
  def new
    @travelticket = Travelticket.new
  end

  # GET /traveltickets/1/edit
  def edit
  end

  # POST /traveltickets or /traveltickets.json
  def create
    @travelticket = Travelticket.new(travelticket_params)

    respond_to do |format|
      if @travelticket.save
        format.html { redirect_to @travelticket, notice: "Travelticket was successfully created." }
        format.json { render :show, status: :created, location: @travelticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @travelticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /traveltickets/1 or /traveltickets/1.json
  def update
    respond_to do |format|
      if @travelticket.update(travelticket_params)
        format.html { redirect_to @travelticket, notice: "Travelticket was successfully updated." }
        format.json { render :show, status: :ok, location: @travelticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @travelticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /traveltickets/1 or /traveltickets/1.json
  def destroy
    @travelticket.destroy
    respond_to do |format|
      format.html { redirect_to traveltickets_url, notice: "Travelticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travelticket
      @travelticket = Travelticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def travelticket_params
      params.require(:travelticket).permit(:name_fr, :name_en, :name_de, :image,:alias_ids=>[])
    end
end
