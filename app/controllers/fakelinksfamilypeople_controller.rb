class FakelinksfamilypeopleController < ApplicationController
  before_action :set_fakelinksfamilyperson, only: %i[ show edit update destroy ]
    include MyhelperHelper
    before_action :allmylinks, only: [:links]
    before_action :allthepeople, only: [:people, :otherpeople]
layout false, only: [:people, :otherpeople, :links]
def links
    end
    def people

    end
    def otherpeople
    end
  # GET /fakelinksfamilypeople or /fakelinksfamilypeople.json
  def index
    @fakelinksfamilypeople = Fakelinksfamilyperson.all
  end

  # GET /fakelinksfamilypeople/1 or /fakelinksfamilypeople/1.json
  def show
  end

  # GET /fakelinksfamilypeople/new
  def new
    @fakelinksfamilyperson = Fakelinksfamilyperson.new
  end

  # GET /fakelinksfamilypeople/1/edit
  def edit
  end

  # POST /fakelinksfamilypeople or /fakelinksfamilypeople.json
  def create
    @fakelinksfamilyperson = Fakelinksfamilyperson.new(fakelinksfamilyperson_params)

    respond_to do |format|
      if @fakelinksfamilyperson.save
        format.html { redirect_to @fakelinksfamilyperson, notice: "Fakelinksfamilyperson was successfully created." }
        format.json { render :show, status: :created, location: @fakelinksfamilyperson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fakelinksfamilyperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fakelinksfamilypeople/1 or /fakelinksfamilypeople/1.json
  def update
    respond_to do |format|
      if @fakelinksfamilyperson.update(fakelinksfamilyperson_params)
        format.html { redirect_to @fakelinksfamilyperson, notice: "Fakelinksfamilyperson was successfully updated." }
        format.json { render :show, status: :ok, location: @fakelinksfamilyperson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fakelinksfamilyperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fakelinksfamilypeople/1 or /fakelinksfamilypeople/1.json
  def destroy
    @fakelinksfamilyperson.destroy
    respond_to do |format|
      format.html { redirect_to fakelinksfamilypeople_url, notice: "Fakelinksfamilyperson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fakelinksfamilyperson
      @fakelinksfamilyperson = Fakelinksfamilyperson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fakelinksfamilyperson_params
      params.require(:fakelinksfamilyperson).permit(:twoperson_id, :familylink_id, :user_id, :twoperson_attributes=>{})
    end
end
