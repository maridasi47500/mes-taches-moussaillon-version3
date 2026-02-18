class PersongraduatedschoolsController < ApplicationController
  before_action :set_persongraduatedschool, only: %i[ show edit update destroy ]
layout false, only: [:trophies,:photos]
include MyhelperHelper
before_action :allthephotos, only: [:photos]
before_action :allthetrophies, only: [:trophies]

  # GET /persongraduatedschools or /persongraduatedschools.json
  def index
    @persongraduatedschools = Persongraduatedschool.all
  end

  # GET /persongraduatedschools/1 or /persongraduatedschools/1.json
  def show
  end

  # GET /persongraduatedschools/new
  def new
    @persongraduatedschool = Persongraduatedschool.new
  end

  # GET /persongraduatedschools/1/edit
  def edit
  end

  # POST /persongraduatedschools or /persongraduatedschools.json
  def create
    @persongraduatedschool = Persongraduatedschool.new(persongraduatedschool_params)

    respond_to do |format|
      if @persongraduatedschool.save
        format.html { redirect_to @persongraduatedschool, notice: "Persongraduatedschool was successfully created." }
        format.json { render :show, status: :created, location: @persongraduatedschool }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @persongraduatedschool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /persongraduatedschools/1 or /persongraduatedschools/1.json
  def update
    respond_to do |format|
      if @persongraduatedschool.update(persongraduatedschool_params)
        format.html { redirect_to @persongraduatedschool, notice: "Persongraduatedschool was successfully updated." }
        format.json { render :show, status: :ok, location: @persongraduatedschool }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @persongraduatedschool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /persongraduatedschools/1 or /persongraduatedschools/1.json
  def destroy
    @persongraduatedschool.destroy
    respond_to do |format|
      format.html { redirect_to persongraduatedschools_url, notice: "Persongraduatedschool was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persongraduatedschool
      @persongraduatedschool = Persongraduatedschool.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def persongraduatedschool_params
      params.fetch(:persongraduatedschool, {}).permit(:myphotos=>[],:photo_ids=>[],:trophy_ids=>[])
    end
end
