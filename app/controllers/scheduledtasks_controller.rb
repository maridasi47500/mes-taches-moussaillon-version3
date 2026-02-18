class ScheduledtasksController < ApplicationController
  before_action :set_scheduledtask, only: [:show, :edit, :update, :destroy]

  # GET /scheduledtasks
  # GET /scheduledtasks.json
  def index
    @scheduledtasks = Scheduledtask.all
  end

  # GET /scheduledtasks/1
  # GET /scheduledtasks/1.json
  def show
  end

  # GET /scheduledtasks/new
  def new
    @scheduledtask = Scheduledtask.new
  end

  # GET /scheduledtasks/1/edit
  def edit
  end

  # POST /scheduledtasks
  # POST /scheduledtasks.json
  def create
    @scheduledtask = Scheduledtask.new(scheduledtask_params)

    respond_to do |format|
      if @scheduledtask.save
        format.html { redirect_to @scheduledtask, notice: 'Scheduledtask was successfully created.' }
        format.json { render :show, status: :created, location: @scheduledtask }
      else
        format.html { render :new }
        format.json { render json: @scheduledtask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scheduledtasks/1
  # PATCH/PUT /scheduledtasks/1.json
  def update
    respond_to do |format|
      if @scheduledtask.update(scheduledtask_params)
        format.html { redirect_to @scheduledtask, notice: 'Scheduledtask was successfully updated.' }
        format.json { render :show, status: :ok, location: @scheduledtask }
      else
        format.html { render :edit }
        format.json { render json: @scheduledtask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scheduledtasks/1
  # DELETE /scheduledtasks/1.json
  def destroy
    @scheduledtask.destroy
    respond_to do |format|
      format.html { redirect_to scheduledtasks_url, notice: 'Scheduledtask was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduledtask
      @scheduledtask = Scheduledtask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scheduledtask_params
      params.require(:scheduledtask).permit(:date_and_time, :name,:_destroy, :person_id,:validation_ids=>[],:person_ids=>[])
    end
end
