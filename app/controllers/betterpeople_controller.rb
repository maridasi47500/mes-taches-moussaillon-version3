class BetterpeopleController < ApplicationController
  before_action :set_betterperson, only: %i[ show edit update destroy ]
include MyhelperHelper
before_action :allthepeople, only: [:people1]

layout false, only: [:attitudes, :twopeople, :people,:otherpeople,:people1]
def attitudes
@attitudes = Attitude.findbyid(params[:id])
end


def people
@people=Person.findbyid(params[:id])
end
def otherpeople
@people=Person.findbyid(params[:id])
end

def twopeople
@twopeople = Twoperson.findbyid(params[:id])
end
  # GET /betterpeople or /betterpeople.json
  def index
    @betterpeople = Betterperson.all
  end

  # GET /betterpeople/1 or /betterpeople/1.json
  def show
if params['cancel.x']

    @betterperson.findthemost.where(user: current_user).destroy_all
elsif params['person.x'] && params['userid']
    @betterperson.findthemost.create!(themost: 1, user_id: params[:userid])
elsif params['otherperson.x'] && params['userid']

    @betterperson.findthemost.create!(themost: 2, user_id: params[:userid])
elsif params['personlgbt.x'] && params['userid'] && params[:person_id]
@alias=Alias.createwithiduser(params[:person_id], current_user)[0]

    @betterperson.findthemostlgbts.create!(themost: 1, alias: @alias)
elsif params['otherpersonlgbt.x'] && params['userid'] && params[:person_id]
@alias=Alias.createwithiduser(params[:person_id], current_user)[0]

    @betterperson.findthemostlgbts.create!(themost: 2, alias: @alias)
  end
rescue ActiveRecord::RecordInvalid
  end

  # GET /betterpeople/new
  def new
    @betterperson = Betterperson.new
  end

  # GET /betterpeople/1/edit
  def edit
  end

  # POST /betterpeople or /betterpeople.json
  def create
    @betterperson = Betterperson.new(betterperson_params)

    respond_to do |format|
      if @betterperson.save
        format.html { redirect_to @betterperson, notice: "Betterperson was successfully created." }
        format.json { render :show, status: :created, location: @betterperson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @betterperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /betterpeople/1 or /betterpeople/1.json
  def update
    respond_to do |format|
      if @betterperson.update(betterperson_params)
        format.html { redirect_to @betterperson, notice: "Betterperson was successfully updated." }
        format.json { render :show, status: :ok, location: @betterperson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @betterperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /betterpeople/1 or /betterpeople/1.json
  def destroy
    @betterperson.destroy
    respond_to do |format|
      format.html { redirect_to betterpeople_url, notice: "Betterperson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_betterperson
      @betterperson = Betterperson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def betterperson_params
      params.require(:betterperson).permit(:attitude_id, :twoperson_id, :user_id,:twoperson_attributes=>{})
    end
end
