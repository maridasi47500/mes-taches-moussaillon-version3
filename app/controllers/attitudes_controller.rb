class AttitudesController < ApplicationController
  before_action :set_attitude, only: [:show, :edit, :update, :destroy]
  layout false, only: [:myfollowers,:mysailors,:chercherattitude,:peoplebuyclothes,:peoplebuytraveltickets]

  # GET /attitudes
  # GET /attitudes.json
  def jsonpeoplebuyclothes
    @t=Peoplebuyclothing.findbyname(params[:name])
    render json: @t
  end
  def jsonpeoplebuytraveltickets
    @t=Peoplebuytravelticket.findbyname(params[:name])
    render json: @t
  end
  def peoplebuyclothes
    @peoplebuyclothes=Peoplebuyclothing.findbyid(params[:id])
  end
  def peoplebuytraveltickets
    @peoplebuytraveltickets=Peoplebuytravelticket.findbyid(params[:id])
  end
  def myotherattitudes
    sailor=params[:attitudesailor1]
    @attitude1 = Attitudeshavesailor.find(sailor) if sailor rescue nil
    amateur=params[:attitudeamateur1]
    @attitude1 ||= Attitudehavefollower.find(amateur) if amateur rescue nil
    sailor2=params[:attitudesailor2]
    @attitude2 = Attitudeshavesailor.find(sailor2) if sailor2 rescue nil
    amateur2=params[:attitudeamateur2]
    @attitude2 ||= Attitudehavefollower.find(amateur2) if amateur2 rescue nil
  end
  def chercherattitude
    @attitudes=Attitude.findbyid(params[:id])
  end
  def myattitudes
    sailor=params[:attitudesailor1]
    @attitude1 = Attitudeshavesailor.find(sailor) if sailor
    amateur=params[:attitudeamateur1]
    @attitude1 ||= Attitudehavefollower.find(amateur) if amateur
  end

  def index
    @attitudes = Attitude.all
  end

  # GET /attitudes/1
  # GET /attitudes/1.json
  def show
  end

  # GET /attitudes/new
  def new
    @attitude = Attitude.new
  end

  # GET /attitudes/1/edit
  def edit
  end
  def attitudejson
    @attitudes=Attitude.findbyname(params[:name])
    render json: @attitudes
  end
  def myfollowers
    @people=Person.find1pplbyid(params[:id])
  end
  def mysailors
    @people=Person.find1pplbyid(params[:id])
  end

  # POST /attitudes
  # POST /attitudes.json
  def create
    @attitude = Attitude.new(attitude_params)

    respond_to do |format|
      if @attitude.save
        format.html { redirect_to @attitude, notice: 'Attitude was successfully created.' }
        format.json { render :show, status: :created, location: @attitude }
      else
        format.html { render :new }
        format.json { render json: @attitude.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attitudes/1
  # PATCH/PUT /attitudes/1.json
  def update
    respond_to do |format|
      if @attitude.update(attitude_params)
        format.html { redirect_to @attitude, notice: 'Attitude was successfully updated.' }
        format.json { render :show, status: :ok, location: @attitude }
      else
        format.html { render :edit }
        format.json { render json: @attitude.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attitudes/1
  # DELETE /attitudes/1.json
  def destroy
    @attitude.destroy
    respond_to do |format|
      format.html { redirect_to attitudes_url, notice: 'Attitude was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attitude
      @attitude = Attitude.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attitude_params
      params.fetch(:attitude, {}).permit(:didit, :name_fr,:name_en,:name_de,:image,:description,:sailor_ids=>[],:amateur_ids=>[],:peoplebuyclothing_ids=>[],:peoplebuytravelticket_ids=>[])
    end
end
