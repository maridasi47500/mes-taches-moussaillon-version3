class ComputingstuffsController < ApplicationController
  before_action :set_computingstuff, only: %i[ show edit update destroy ]
  include MyhelperHelper
  before_action :allthepeople, only: %i[ people ]
  layout false, only: %i[ people ]
  def people
  end


  # GET /computingstuffs or /computingstuffs.json
  def index
    @computingstuffs = Computingstuff.all
  end

  # GET /computingstuffs/1 or /computingstuffs/1.json
  def show
  end

  # GET /computingstuffs/new
  def new
    @computingstuff = Computingstuff.new
  end

  # GET /computingstuffs/1/edit
  def edit
  end

  # POST /computingstuffs or /computingstuffs.json
  def create
    @computingstuff = Computingstuff.new(computingstuff_params)

    respond_to do |format|
      if @computingstuff.save
        format.html { redirect_to @computingstuff, notice: "Computingstuff was successfully created." }
        format.json { render :show, status: :created, location: @computingstuff }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @computingstuff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computingstuffs/1 or /computingstuffs/1.json
  def update
    respond_to do |format|
      if @computingstuff.update(computingstuff_params)
        format.html { redirect_to @computingstuff, notice: "Computingstuff was successfully updated." }
        format.json { render :show, status: :ok, location: @computingstuff }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @computingstuff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computingstuffs/1 or /computingstuffs/1.json
  def destroy
    @computingstuff.destroy
    respond_to do |format|
      format.html { redirect_to computingstuffs_url, notice: "Computingstuff was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computingstuff
      @computingstuff = Computingstuff.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def computingstuff_params
      params.require(:computingstuff).permit(:name, :image,:person_ids=>[])
    end
end
