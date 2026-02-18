class SocialcontractsController < ApplicationController
  before_action :set_socialcontract, only: %i[ show edit update destroy ]

  # GET /socialcontracts or /socialcontracts.json
  def index
    @socialcontracts = Socialcontract.all
  end

  # GET /socialcontracts/1 or /socialcontracts/1.json
  def show
  end

  # GET /socialcontracts/new
  def new
    @socialcontract = Socialcontract.new
  end

  # GET /socialcontracts/1/edit
  def edit
  end

  # POST /socialcontracts or /socialcontracts.json
  def create
    @socialcontract = Socialcontract.new(socialcontract_params)

    respond_to do |format|
      if @socialcontract.save
        format.html { redirect_to @socialcontract, notice: "Socialcontract was successfully created." }
        format.json { render :show, status: :created, location: @socialcontract }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @socialcontract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /socialcontracts/1 or /socialcontracts/1.json
  def update
    respond_to do |format|
      if @socialcontract.update(socialcontract_params)
        format.html { redirect_to @socialcontract, notice: "Socialcontract was successfully updated." }
        format.json { render :show, status: :ok, location: @socialcontract }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @socialcontract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /socialcontracts/1 or /socialcontracts/1.json
  def destroy
    @socialcontract.destroy
    respond_to do |format|
      format.html { redirect_to socialcontracts_url, notice: "Socialcontract was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socialcontract
      @socialcontract = Socialcontract.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def socialcontract_params
      params.require(:socialcontract).permit(:person_id, :otherperson_id)
    end
end
