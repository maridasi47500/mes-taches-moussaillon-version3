class LifestateshaverequestsController < ApplicationController
  before_action :set_lifestateshaverequest, only: %i[ show edit update destroy ]

  # GET /lifestateshaverequests or /lifestateshaverequests.json
  def index
    @lifestateshaverequests = Lifestateshaverequest.all
  end

  # GET /lifestateshaverequests/1 or /lifestateshaverequests/1.json
  def show
  end

  # GET /lifestateshaverequests/new
  def new
    @lifestateshaverequest = Lifestateshaverequest.new
  end

  # GET /lifestateshaverequests/1/edit
  def edit
  end

  # POST /lifestateshaverequests or /lifestateshaverequests.json
  def create
    @lifestateshaverequest = Lifestateshaverequest.new(lifestateshaverequest_params)

    respond_to do |format|
      if @lifestateshaverequest.save
        format.html { redirect_to @lifestateshaverequest, notice: "Lifestateshaverequest was successfully created." }
        format.json { render :show, status: :created, location: @lifestateshaverequest }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lifestateshaverequest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lifestateshaverequests/1 or /lifestateshaverequests/1.json
  def update
    respond_to do |format|
      if @lifestateshaverequest.update(lifestateshaverequest_params)
        format.html { redirect_to @lifestateshaverequest, notice: "Lifestateshaverequest was successfully updated." }
        format.json { render :show, status: :ok, location: @lifestateshaverequest }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lifestateshaverequest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lifestateshaverequests/1 or /lifestateshaverequests/1.json
  def destroy
    @lifestateshaverequest.destroy
    respond_to do |format|
      format.html { redirect_to lifestateshaverequests_url, notice: "Lifestateshaverequest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lifestateshaverequest
      @lifestateshaverequest = Lifestateshaverequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lifestateshaverequest_params
      params.require(:lifestateshaverequest).permit(:personhavelifestate_id, :requeststoperson_id)
    end
end
