class HackertasksController < ApplicationController
  before_action :set_hackertask, only: %i[ show edit update destroy ]

def tvseriesjson
      @tvseries=Tvseries.findbyname(params[:name])
render json: @tvseries
end
def tvseries
      id=params[:id]
      @tvseries=Tvseries.where(id: id)
render layout: false
end
def people
      id=params[:id]
      @people=Person.where(id: id)
render layout: false
end
  # GET /hackertasks or /hackertasks.json
  def index
    @hackertasks = Hackertask.all
  end

  # GET /hackertasks/1 or /hackertasks/1.json
  def show
  end

  # GET /hackertasks/new
  def new
    @hackertask = Hackertask.new
  end

  # GET /hackertasks/1/edit
  def edit
  end

  # POST /hackertasks or /hackertasks.json
  def create
    @hackertask = Hackertask.new(hackertask_params)

    respond_to do |format|
      if @hackertask.save
        format.html { redirect_to @hackertask, notice: "Hackertask was successfully created." }
        format.json { render :show, status: :created, location: @hackertask }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hackertask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hackertasks/1 or /hackertasks/1.json
  def update
    respond_to do |format|
      if @hackertask.update(hackertask_params)
        format.html { redirect_to @hackertask, notice: "Hackertask was successfully updated." }
        format.json { render :show, status: :ok, location: @hackertask }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hackertask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hackertasks/1 or /hackertasks/1.json
  def destroy
    @hackertask.destroy
    respond_to do |format|
      format.html { redirect_to hackertasks_url, notice: "Hackertask was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hackertask
      @hackertask = Hackertask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hackertask_params
    params.require(:hackertask).permit(:validatetickets,:unvalidatetickets,:everyone,:happened,:image,:newnamecollection,:nbtimes, :idoit, :type, :manner_id, :description,:end_at,:event_type_id, :start_at, :longitude, :person_id, :latitude, :city_id, :place_id, :state_id,:country_id, :address, :name,:eventid,:personid,:taskshaveaccomplishments_attributes=>{},:relatedperson_ids=>[],:gossip_ids=>[],:mycollection_ids=>[],:addresses_attributes=>{}, :accomplishedsailor_ids=>[],:sailor_ids=>[], :relatedtask_ids=>[],:relatedtasksinputs=>[],:mycollection_ids=>[],:sailorsinputs=>[],:person_ids=>[],:event_ids=>[],:relatedpeopleinputs=>[],:task_ids=>[],:presentperson_ids=>[],:place_ids=>[],:thing_ids=>[],:linkedtask_ids=>[],:recordmyphrasesandwords=>[], :sailorhavingthistask=>[],:recordmywords=>[],:mytaskwiththerecording=>[],:myownphrasesandwords=>[], :contentmyownphrasesandwords=>[], :myownwords=>[],:contentmyownwords=>[], :recordmyphrasesandwords1=>[],:recordmywords1=>[],:myownphrasesandwords1=>[],:contentmyownphrasesandwords1=>[],:myownwords1=>[],:contentmyownwords1=>[],:recordmyphrasesandwords2=>[],:recordmywords2=>[],:myownphrasesandwords2=>[],:contentmyownphrasesandwords2=>[],:myownwords2=>[],:contentmyownwords2=>[],:addmyrelation_id=>[], :addmyrelation_text=>[],:addmybigrelation_id=>[],:addmymiddlerelation_id=>[], :mysailorsgetter=>[],:tvseries_ids=>[])

    end
end
