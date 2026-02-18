class SailorjobhaveratingsController < ApplicationController
  before_action :set_sailorjobhaverating, only: %i[ show edit update destroy ]

  # GET /sailorjobhaveratings or /sailorjobhaveratings.json
  def index
    @sailorjobhaveratings = Sailorjobhaverating.all
  end

  # GET /sailorjobhaveratings/1 or /sailorjobhaveratings/1.json
  def show
  end

  # GET /sailorjobhaveratings/new
  def new
    @sailorjobhaverating = Sailorjobhaverating.new
  end

  # GET /sailorjobhaveratings/1/edit
  def edit
  end

  # POST /sailorjobhaveratings or /sailorjobhaveratings.json
  def create
    @sailorjobhaverating = Sailorjobhaverating.new(sailorjobhaverating_params)
    @sailorjobhaverating.user = current_user
  @action=(1..5).to_a.map {|x| [params["task#{x}.x"],x]}.select{|x|x[0]}[0][1] rescue nil
    @sailorjobhaverating.rating = @action


    respond_to do |format|
      if @sailorjobhaverating.save
        format.html { redirect_to @sailorjobhaverating.sailorjob.task, notice: "Sailorjobhaverating was successfully created." }
        format.json { render :show, status: :created, location: @sailorjobhaverating }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sailorjobhaverating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sailorjobhaveratings/1 or /sailorjobhaveratings/1.json
  def update
    respond_to do |format|
      if @sailorjobhaverating.update(sailorjobhaverating_params)
        format.html { redirect_to @sailorjobhaverating.sailorjob.task, notice: "Sailorjobhaverating was successfully updated." }
        format.json { render :show, status: :ok, location: @sailorjobhaverating }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sailorjobhaverating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sailorjobhaveratings/1 or /sailorjobhaveratings/1.json
  def destroy
    @sailorjobhaverating.destroy
    respond_to do |format|
      format.html { redirect_to sailorjobhaveratings_url, notice: "Sailorjobhaverating was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sailorjobhaverating
      @sailorjobhaverating = Sailorjobhaverating.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sailorjobhaverating_params
      params.require(:sailorjobhaverating).permit(:rating, :user_id, :sailorjob_id, :datetime)
    end
end
