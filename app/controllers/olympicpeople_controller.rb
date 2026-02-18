class OlympicpeopleController < ApplicationController
  before_action :set_olympicperson, only: %i[ show edit update destroy ]
layout false, only: [:people, :otherpeople, :skills, :events]
  def events
    @events=Event.findbyid(params[:id])
  end
  def people
    @people=Person.findbyid(params[:id])
  end
  def otherpeople
    @people=Person.findbyid(params[:id])
  end
  def skills
    @skills=Skill.findbyid(params[:id])
  end



  # GET /olympicpeople or /olympicpeople.json
  def index
    @olympicpeople = Olympicperson.all
@ol=Olympicperson.new(twoperson: Twoperson.new(person: Person.new(name: "Personne Olympique"), otherperson: Person.new(name: "Personne Olympique")), skill: Skill.new(name_fr: "Epreuve Olympique"))
@vs=@ol.findthebests.new(user: current_user, winner: 1)
  end

  # GET /olympicpeople/1 or /olympicpeople/1.json
  def show
if params['cancel.x']

    @olympicperson.findthebests.where(user: current_user).destroy_all
elsif params['person.x'] && params['userid']
    @olympicperson.findthebests.create!(winner: 1, user_id: params[:userid])
elsif params['otherperson.x'] && params['userid']

    @olympicperson.findthebests.create!(winner: 2, user_id: params[:userid])
  end
  rescue ActiveRecord::RecordInvalid
  

  end

  # GET /olympicpeople/new
  def new
    @olympicperson = Olympicperson.new(user: current_user)
  end

  # GET /olympicpeople/1/edit
  def edit
    if !@olympicperson.user
    @olympicperson.user= current_user
    end
  end

  # POST /olympicpeople or /olympicpeople.json
  def create
    @olympicperson = Olympicperson.new(olympicperson_params)

    respond_to do |format|
      if @olympicperson.save
        format.html { redirect_to @olympicperson, notice: "Olympicperson was successfully created." }
        format.json { render :show, status: :created, location: @olympicperson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @olympicperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /olympicpeople/1 or /olympicpeople/1.json
  def update
    respond_to do |format|
      if @olympicperson.update(olympicperson_params)
        format.html { redirect_to @olympicperson, notice: "Olympicperson was successfully updated." }
        format.json { render :show, status: :ok, location: @olympicperson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @olympicperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /olympicpeople/1 or /olympicpeople/1.json
  def destroy
    @olympicperson.destroy
    respond_to do |format|
      format.html { redirect_to olympicpeople_url, notice: "Olympicperson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_olympicperson
      @olympicperson = Olympicperson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def olympicperson_params
      params.require(:olympicperson).permit(:user_id, :person_id, :twoperson_id,:otherperson_id, :skill_id,:person_attributes=>{}, :otherperson_attributes=>{},:twoperson_attributes=>{},:event_ids=>[])
    end
end
