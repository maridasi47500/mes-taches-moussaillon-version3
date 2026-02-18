class FactoryservicesController < ApplicationController
  before_action :set_factoryservice, only: %i[ show edit update destroy ]

  include MyhelperHelper
  before_action :allthepeople, only: %i[ people ]
  before_action :allthefactories, only: %i[ factories ]
  layout false, only: %i[ people factories factoriesservicehaveemployees]
  def people
  end
  def factories
  end

  # GET /factoryservices or /factoryservices.json
  def index
    @factoryservices = Factoryservice.all
  end

  # GET /factoryservices/1 or /factoryservices/1.json
  def show
  end

  # GET /factoryservices/new
  def new
    @factoryservice = Factoryservice.new
  end

  # GET /factoryservices/1/edit
  def edit
  end

  # POST /factoryservices or /factoryservices.json
  def create
    @factoryservice = Factoryservice.new(factoryservice_params)

    respond_to do |format|
      if @factoryservice.save
        format.html { redirect_to @factoryservice, notice: "Factoryservice was successfully created." }
        format.json { render :show, status: :created, location: @factoryservice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @factoryservice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /factoryservices/1 or /factoryservices/1.json
  def update
    respond_to do |format|
      if @factoryservice.update(factoryservice_params)
        format.html { redirect_to @factoryservice, notice: "Factoryservice was successfully updated." }
        format.json { render :show, status: :ok, location: @factoryservice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @factoryservice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factoryservices/1 or /factoryservices/1.json
  def destroy
    @factoryservice.destroy
    respond_to do |format|
      format.html { redirect_to factoryservices_url, notice: "Factoryservice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factoryservice
      @factoryservice = Factoryservice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def factoryservice_params
      params.require(:factoryservice).permit(:name, :image,:person_ids=>[],:factory_ids=>[])
    end
end
