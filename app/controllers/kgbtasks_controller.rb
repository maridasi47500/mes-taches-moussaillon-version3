class KgbtasksController < ApplicationController
  before_action :set_Kgbtask, only: %i[ show edit update destroy ]
def people
      id=params[:id]
      @people=Person.where(id: id)
render layout: false
end


  # GET /Kgbtasks or /Kgbtasks.json
  def index
    @Kgbtasks = Kgbtask.all
  end

  # GET /Kgbtasks/1 or /Kgbtasks/1.json
  def show
  end

  # GET /Kgbtasks/new
  def new
    @Kgbtask = Kgbtask.new
  end

  # GET /Kgbtasks/1/edit
  def edit
  end

  # POST /Kgbtasks or /Kgbtasks.json
  def create
    @Kgbtask = Kgbtask.new(kgbtask_params)

    respond_to do |format|
      if @Kgbtask.save
        format.html { redirect_to @Kgbtask, notice: "Kgbtask was successfully created." }
        format.json { render :show, status: :created, location: @Kgbtask }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @Kgbtask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Kgbtasks/1 or /Kgbtasks/1.json
  def update
    respond_to do |format|
      if @Kgbtask.update(kgbtask_params)
        format.html { redirect_to @Kgbtask, notice: "Kgbtask was successfully updated." }
        format.json { render :show, status: :ok, location: @Kgbtask }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @Kgbtask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Kgbtasks/1 or /Kgbtasks/1.json
  def destroy
    @Kgbtask.destroy
    respond_to do |format|
      format.html { redirect_to Kgbtasks_url, notice: "Kgbtask was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Kgbtask
      @Kgbtask = Kgbtask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kgbtask_params
    params.require(:kgbtask).permit(:validatetickets,:unvalidatetickets,:everyone,:happened,:image,:newnamecollection,:nbtimes, :idoit, :type, :manner_id, :description,:end_at,:event_type_id, :start_at, :longitude, :person_id, :latitude, :city_id, :place_id, :state_id,:country_id, :address, :name,:eventid,:personid,:taskshaveaccomplishments_attributes=>{},:relatedperson_ids=>[],:gossip_ids=>[],:mycollection_ids=>[],:addresses_attributes=>{}, :accomplishedsailor_ids=>[],:sailor_ids=>[], :relatedtask_ids=>[],:relatedtasksinputs=>[],:mycollection_ids=>[],:sailorsinputs=>[],:person_ids=>[],:event_ids=>[],:relatedpeopleinputs=>[],:task_ids=>[],:presentperson_ids=>[],:place_ids=>[],:thing_ids=>[],:linkedtask_ids=>[],:recordmyphrasesandwords=>[], :sailorhavingthistask=>[],:recordmywords=>[],:mytaskwiththerecording=>[],:myownphrasesandwords=>[], :contentmyownphrasesandwords=>[], :myownwords=>[],:contentmyownwords=>[], :recordmyphrasesandwords1=>[],:recordmywords1=>[],:myownphrasesandwords1=>[],:contentmyownphrasesandwords1=>[],:myownwords1=>[],:contentmyownwords1=>[],:recordmyphrasesandwords2=>[],:recordmywords2=>[],:myownphrasesandwords2=>[],:contentmyownphrasesandwords2=>[],:myownwords2=>[],:contentmyownwords2=>[],:addmyrelation_id=>[], :addmyrelation_text=>[],:addmybigrelation_id=>[],:addmymiddlerelation_id=>[], :mysailorsgetter=>[],:tvseries_ids=>[])

    end
end
