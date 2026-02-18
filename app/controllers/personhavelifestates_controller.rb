class PersonhavelifestatesController < ApplicationController
  before_action :set_personhavelifestate, only: %i[ myphotos show edit update destroy ]
include MyhelperHelper
  before_action :allthephotos, only: [:photos]
  before_action :alltherequeststopeople, only: [:requeststopeople]
layout false, only: [:photos,:requeststopeople]


  def photos
  end
  # GET /personhavelifestates or /personhavelifestates.json
  def index
    @personhavelifestates = Personhavelifestate.all
  end

  # GET /personhavelifestates/1 or /personhavelifestates/1.json
  def show
  end

  # GET /personhavelifestates/new
  def new
    @personhavelifestate = Personhavelifestate.new
  end

  # GET /personhavelifestates/1/edit
  def edit
  end

  # POST /personhavelifestates or /personhavelifestates.json
  def create
    @personhavelifestate = Personhavelifestate.new(personhavelifestate_params)

    respond_to do |format|
      if @personhavelifestate.save
        format.html { redirect_to @personhavelifestate, notice: "Personhavelifestate was successfully created." }
        format.json { render :show, status: :created, location: @personhavelifestate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personhavelifestate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personhavelifestates/1 or /personhavelifestates/1.json
  def update
    respond_to do |format|
      if @personhavelifestate.update(personhavelifestate_params)
        format.html { redirect_to @personhavelifestate, notice: "Personhavelifestate was successfully updated." }
        format.json { render :show, status: :ok, location: @personhavelifestate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @personhavelifestate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personhavelifestates/1 or /personhavelifestates/1.json
  def destroy
    @personhavelifestate.destroy
    respond_to do |format|
      format.html { redirect_to personhavelifestates_url, notice: "Personhavelifestate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personhavelifestate
      @personhavelifestate = Personhavelifestate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def personhavelifestate_params
      params.fetch(:personhavelifestate, {}).permit(:requeststoperson_ids=>[],:photo_ids=>[])
    end
end
