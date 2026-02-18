class SurnamesController < ApplicationController
  before_action :set_surname, only: %i[ show edit update destroy ]
include JsonhelperHelper
include MyhelperHelper
layout false, only: [:people,:schools,:nationalities,:websites,:jsonwebsites]
before_action :json_allthewebsites, only: [:jsonwebsites]
before_action :allthewebsites, only: [:websites]

def jsonwebsites
render json: @websites
end
def websites
end

  # GET /surnames or /surnames.json
def json
@s=Surname.findbyname(params[:name])
render json: @s
end
def schools
@schools=School.findbyid(params[:id])
end
def nationalities
@nationalities=Nationality.findbyid(params[:id])
end
def people
@people=Person.findbyid(params[:id])
end
def names
      @surnames=Surname.find_by_name(params[:name])
render json: @surnames
end

  def index
    @surnames = Surname.bypage(params[:page].to_i)
  end

  # GET /surnames/1 or /surnames/1.json
  def show
  end

  # GET /surnames/new
  def new
    @surname = Surname.new
  end

  # GET /surnames/1/edit
  def edit
  end

  # POST /surnames or /surnames.json
  def create
    @surname = Surname.new(surname_params)

    respond_to do |format|
      if @surname.save
        format.html { redirect_to @surname, notice: "Surname was successfully created." }
        format.json { render :show, status: :created, location: @surname }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @surname.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surnames/1 or /surnames/1.json
  def update
    respond_to do |format|
      if @surname.update(surname_params)
        format.html { redirect_to @surname, notice: "Surname was successfully updated." }
        format.json { render :show, status: :ok, location: @surname }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @surname.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surnames/1 or /surnames/1.json
  def destroy
    @surname.destroy
    respond_to do |format|
      format.html { redirect_to surnames_url, notice: "Surname was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_surname
      @surname = Surname.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def surname_params
      params.require(:surname).permit(:name,:person_ids=>[],:school_ids=>[],:nationality_ids=>[],:website_ids=>[])
    end
end
