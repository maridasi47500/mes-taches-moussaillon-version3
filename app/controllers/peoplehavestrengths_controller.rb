class PeoplehavestrengthsController < ApplicationController
  before_action :set_peoplehavestrength, only: %i[ show edit update destroy ]
layout false, only: [:strengths,:linkspousepeople]
def strengths
@strengths=Strength.findbyid(params[:id])
end
def linkspousepeople
@linkspousepeople=Linkspouseperson.findbyid(params[:id])
end


  # GET /peoplehavestrengths or /peoplehavestrengths.json
  def index
    @peoplehavestrengths = Peoplehavestrength.all
  end

  # GET /peoplehavestrengths/1 or /peoplehavestrengths/1.json
  def show
  end

  # GET /peoplehavestrengths/new
  def new
    @peoplehavestrength = Peoplehavestrength.new
  end

  # GET /peoplehavestrengths/1/edit
  def edit
  end

  # POST /peoplehavestrengths or /peoplehavestrengths.json
  def create
    @peoplehavestrength = Peoplehavestrength.new(peoplehavestrength_params)

    respond_to do |format|
      if @peoplehavestrength.save
        format.html { redirect_to @peoplehavestrength, notice: "Peoplehavestrength was successfully created." }
        format.json { render :show, status: :created, location: @peoplehavestrength }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @peoplehavestrength.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /peoplehavestrengths/1 or /peoplehavestrengths/1.json
  def update
    respond_to do |format|
      if @peoplehavestrength.update(peoplehavestrength_params)
        format.html { redirect_to @peoplehavestrength, notice: "Peoplehavestrength was successfully updated." }
        format.json { render :show, status: :ok, location: @peoplehavestrength }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @peoplehavestrength.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peoplehavestrengths/1 or /peoplehavestrengths/1.json
  def destroy
    @peoplehavestrength.destroy
    respond_to do |format|
      format.html { redirect_to peoplehavestrengths_url, notice: "Peoplehavestrength was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peoplehavestrength
      @peoplehavestrength = Peoplehavestrength.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def peoplehavestrength_params
      params.require(:peoplehavestrength).permit(:person_id, :strength_id, :user_id, :linkspouseperson_id)
    end
end
