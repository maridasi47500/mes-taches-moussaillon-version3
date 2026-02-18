class PetshaveownersController < ApplicationController
  before_action :set_petshaveowner, only: %i[ show edit update destroy ]
  include MyhelperHelper
  before_action :allthephotos, only: %i[ photos ]
  layout false, only: %i[ photos ]
  def photos
  end


  # GET /petshaveowners or /petshaveowners.json
  def index
    @petshaveowners = Petshaveowner.all
  end

  # GET /petshaveowners/1 or /petshaveowners/1.json
  def show
  end

  # GET /petshaveowners/new
  def new
    @petshaveowner = Petshaveowner.new
  end

  # GET /petshaveowners/1/edit
  def edit
  end

  # POST /petshaveowners or /petshaveowners.json
  def create
    @petshaveowner = Petshaveowner.new(petshaveowner_params)

    respond_to do |format|
      if @petshaveowner.save
        format.html { redirect_to @petshaveowner, notice: "Petshaveowner was successfully created." }
        format.json { render :show, status: :created, location: @petshaveowner }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @petshaveowner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /petshaveowners/1 or /petshaveowners/1.json
  def update
    respond_to do |format|
      if @petshaveowner.update(petshaveowner_params)
        format.html { redirect_to @petshaveowner.pet, notice: "Petshaveowner was successfully updated." }
        format.json { render :show, status: :ok, location: @petshaveowner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @petshaveowner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /petshaveowners/1 or /petshaveowners/1.json
  def destroy
    @petshaveowner.destroy
    respond_to do |format|
      format.html { redirect_to petshaveowners_url, notice: "Petshaveowner was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_petshaveowner
      @petshaveowner = Petshaveowner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def petshaveowner_params
      params.fetch(:petshaveowner, {}).permit(:photo_ids=>[])
    end
end
