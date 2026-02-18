class TogethertvseriesratingsController < ApplicationController
  before_action :set_togethertvseriesrating, only: %i[ show edit update destroy ]
include MyhelperHelper
include JsonhelperHelper
before_action :allthepeople, only: [:people]
layout false, only: [:people,:myform]

  # GET /togethertvseriesratings or /togethertvseriesratings.json
  def index
    @togethertvseriesratings = Togethertvseriesrating.all
  end

  # GET /togethertvseriesratings/1 or /togethertvseriesratings/1.json
  def show
  end

  # GET /togethertvseriesratings/new
  def new
    @togethertvseriesrating = Togethertvseriesrating.new
  end

  # GET /togethertvseriesratings/1/edit
  def edit
  end

  # POST /togethertvseriesratings or /togethertvseriesratings.json
  def create
    @togethertvseriesrating = Togethertvseriesrating.new(togethertvseriesrating_params)
       @togethertvseriesrating.rating=(1..5).to_a.map {|x| [params["#{x}rating.x"],x]}.select{|x|x[0]}[0][1] rescue nil


    respond_to do |format|
      if @togethertvseriesrating.save
        format.html { redirect_to @togethertvseriesrating, notice: "Togethertvseriesrating was successfully created." }
        format.json { render :show, status: :created, location: @togethertvseriesrating }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @togethertvseriesrating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /togethertvseriesratings/1 or /togethertvseriesratings/1.json
  def update
    respond_to do |format|
      if @togethertvseriesrating.update(togethertvseriesrating_params)
       @togethertvseriesrating.rating=(1..5).to_a.map {|x| [params["#{x}rating.x"],x]}.select{|x|x[0]}[0][1] rescue nil
       @togethertvseriesrating.save
        format.html { redirect_to @togethertvseriesrating, notice: "Togethertvseriesrating was successfully updated." }
        format.json { render :show, status: :ok, location: @togethertvseriesrating }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @togethertvseriesrating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /togethertvseriesratings/1 or /togethertvseriesratings/1.json
  def destroy
    @togethertvseriesrating.destroy
    respond_to do |format|
      format.html { redirect_to togethertvseriesratings_url, notice: "Togethertvseriesrating was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_togethertvseriesrating
      @togethertvseriesrating = Togethertvseriesrating.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def togethertvseriesrating_params
      params.require(:togethertvseriesrating).permit(:tvserieshaveactor_id, :user_id, :rating, :content_fr, :content_en, :content_de,:person_ids=>[])
    end
end
