class TechniquesController < ApplicationController
  before_action :set_technique, only: %i[ deletereally formdelete show edit update destroy ]

  # GET /techniques or /techniques.json
  def deletereally
    @technique.delete
    redirect_to techniques_path
  end
  def formdelete
    @techniques = Technique.all
  end
  def index
    @techniques = Technique.all
  end

  # GET /techniques/1 or /techniques/1.json
  def show
  end

  # GET /techniques/new
  def new
    @technique = Technique.new
  end

  # GET /techniques/1/edit
  def edit
  end

  # POST /techniques or /techniques.json
  def create
    @technique = Technique.new(technique_params)

    respond_to do |format|
      if @technique.save
        format.html { redirect_to @technique, notice: "Technique was successfully created." }
        format.json { render :show, status: :created, location: @technique }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @technique.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /techniques/1 or /techniques/1.json
  def update
    respond_to do |format|
      if @technique.update(technique_params)
        format.html { redirect_to @technique, notice: "Technique was successfully updated." }
        format.json { render :show, status: :ok, location: @technique }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @technique.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /techniques/1 or /techniques/1.json
  def destroy
    @technique.destroy
    respond_to do |format|
      format.html { redirect_to techniques_url, notice: "Technique was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_technique
      @technique = Technique.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def technique_params
    params.require(:technique).permit(:technique_id, :nbtimes, :idoit, :manner_id, :description,:end_at,:event_type_id, :start_at, :longitude, :person_id, :latitude, :city_id, :place_id, :state_id,:country_id, :address, :name,:eventid,:personid,:relatedperson_ids=>[], :sailor_ids=>[], :relatedtask_ids=>[],:relatedtasksinputs=>[],:sailorsinputs=>[],:person_ids=>[],:event_ids=>[],:relatedpeopleinputs=>[],:task_ids=>[],:presentperson_ids=>[],:place_ids=>[],:thing_ids=>[])

    end
end
