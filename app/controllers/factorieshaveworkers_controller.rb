class FactorieshaveworkersController < ApplicationController
  before_action :set_factorieshaveworker, only: %i[ show edit update destroy ]
  include MyhelperHelper
  before_action :alltheepochs, only: %i[ epochs ]
  layout false, only: %i[ epochs ]
  def epochs
  end


  # GET /factorieshaveworkers or /factorieshaveworkers.json
  def index
    @factorieshaveworkers = Factorieshaveworker.all
  end

  # GET /factorieshaveworkers/1 or /factorieshaveworkers/1.json
  def show
  end

  # GET /factorieshaveworkers/new
  def new
    @factorieshaveworker = Factorieshaveworker.new
  end

  # GET /factorieshaveworkers/1/edit
  def edit
  end

  # POST /factorieshaveworkers or /factorieshaveworkers.json
  def create
    @factorieshaveworker = Factorieshaveworker.new(factorieshaveworker_params)

    respond_to do |format|
      if @factorieshaveworker.save
        format.html { redirect_to @factorieshaveworker, notice: "Factorieshaveworker was successfully created." }
        format.json { render :show, status: :created, location: @factorieshaveworker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @factorieshaveworker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /factorieshaveworkers/1 or /factorieshaveworkers/1.json
  def update
    respond_to do |format|
      if @factorieshaveworker.update(factorieshaveworker_params)
        format.html { redirect_to @factorieshaveworker.factory, notice: "Factorieshaveworker was successfully updated." }
        format.json { render :show, status: :ok, location: @factorieshaveworker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @factorieshaveworker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factorieshaveworkers/1 or /factorieshaveworkers/1.json
  def destroy
    @factorieshaveworker.destroy
    respond_to do |format|
      format.html { redirect_to factorieshaveworkers_url, notice: "Factorieshaveworker was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factorieshaveworker
      @factorieshaveworker = Factorieshaveworker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def factorieshaveworker_params
      params.fetch(:factorieshaveworker, {}).permit(:epoch_ids=>[])
    end
end
