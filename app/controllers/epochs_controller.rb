class EpochsController < ApplicationController
  before_action :set_epoch, only: %i[ show edit update destroy whatepoch]
  layout false, only: [:person, :student, :grade,:whatepoch]
  include MyhelperHelper
  before_action :allthefactoriesservicehaveemployees, only: [:factoriesservicehaveemployeesjson]
  before_action :factoryservicehasemployee, only: [:factoriesservicehaveemployees]

  before_action :allpeoplewhohavejobs, only: [:peoplehavejobsjson]
  before_action :personwhohasjob, only: [:peoplehavejobs]
  layout false, only: [:peoplehavejobs, :factoriesservicehaveemployees]
  def factoriesservicehaveemployeesjson
    render json: @factoriesservicehaveemployees
  end
  def peoplehavejobs
  end
  def peoplehavejobsjson
    render json: @peoplehavejobs
  end

  def whatepoch
  end
  # GET /epochs or /epochs.json
  def json
    @g=Epoch.findbyname(params[:name])
    render json: @g
  end
  def grade
    @grades=Grade.findbyid(params[:id])
  end
  def student
  end
  def person
    @people=Person.findbyid(params[:id])

  end
  def index
    @epochs = Epoch.all
  end

  # GET /epochs/1 or /epochs/1.json
  def show
@laundry=Laundrycaptain.kpten(current_user)
  end

  # GET /epochs/new
  def new
    @epoch = Epoch.new
  end

  # GET /epochs/1/edit
  def edit
  end

  # POST /epochs or /epochs.json
  def create
    @epoch = Epoch.new(epoch_params)

    respond_to do |format|
      if @epoch.save
        format.html { redirect_to @epoch, notice: "Epoch was successfully created." }
        format.json { render :show, status: :created, location: @epoch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @epoch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /epochs/1 or /epochs/1.json
  def update
    respond_to do |format|
      if @epoch.update(epoch_params)
        format.html { redirect_to @epoch, notice: "Epoch was successfully updated." }
        format.json { render :show, status: :ok, location: @epoch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @epoch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /epochs/1 or /epochs/1.json
  def destroy
    @epoch.destroy
    respond_to do |format|
      format.html { redirect_to epochs_url, notice: "Epoch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_epoch
      @epoch = Epoch.find(params[:id])
@city=City.find(params[:city_id]) rescue nil
@person=Person.find(params[:person_id]) rescue nil
if @city && @person
@peoplecity=PeopleCity.find_by(person: @person,city:@city)
@peoplecityepoch=Peoplecitiesepoch.create(people_city: @peoplecity,epoch:@epoch)
end

    end

    # Only allow a list of trusted parameters through.
    def epoch_params
      params.require(:epoch).permit(:image,:end_at, :start_at, :longitude, :latitude, :city_id, :place_id, :state_id, :address, :name, :created_at, :updated_at, :type, :zoom, :image, :description, :event_type_id, :done, :idoit, :country_id, :nbtimes,:epoch_ids=>[],:peoplehavejob_ids=>[],:factoriesservicehaveemployee_ids=>[],:epochstudents_attributes=>{})
    end
end
