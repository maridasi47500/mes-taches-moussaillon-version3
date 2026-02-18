class SailorandactionsController < ApplicationController
  before_action :set_sailorandaction, only: %i[ show edit update destroy ]

include MyhelperHelper
before_action :allthepeople, only: %i[ sailors ]
layout false, only: [:sailors]

  # GET /sailorandactions or /sailorandactions.json
  def index
    @sailorandactions = Sailorandaction.all
  end

  # GET /sailorandactions/1 or /sailorandactions/1.json
  def show
  end

  # GET /sailorandactions/new
  def new
    @sailorandaction = Sailorandaction.new
  end

  # GET /sailorandactions/1/edit
  def edit
  end

  # POST /sailorandactions or /sailorandactions.json
  def create
    @sailorandaction = Sailorandaction.new(sailorandaction_params)

    respond_to do |format|
      if @sailorandaction.save
        format.html { redirect_to @sailorandaction.taskaction, notice: "Sailorandaction was successfully created." }
        format.json { render :show, status: :created, location: @sailorandaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sailorandaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sailorandactions/1 or /sailorandactions/1.json
  def update
    respond_to do |format|
      if @sailorandaction.update(sailorandaction_params)
        format.html { redirect_to @sailorandaction.taskaction, notice: "Sailorandaction was successfully updated." }
        format.json { render :show, status: :ok, location: @sailorandaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sailorandaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sailorandactions/1 or /sailorandactions/1.json
  def destroy
    @sailorandaction.destroy
    respond_to do |format|
      format.html { redirect_to sailorandactions_url, notice: "Sailorandaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sailorandaction
      @sailorandaction = Sailorandaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sailorandaction_params
      params.fetch(:sailorandaction, {}).permit(:sailor_ids=>[])
    end
end
