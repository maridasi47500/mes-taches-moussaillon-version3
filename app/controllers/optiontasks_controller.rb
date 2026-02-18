class OptiontasksController < ApplicationController
  before_action :set_optiontask, only: %i[ show edit update destroy ]

  # GET /optiontasks or /optiontasks.json
  def index
    @optiontasks = Optiontask.all
  end

  # GET /optiontasks/1 or /optiontasks/1.json
  def show
  end

  # GET /optiontasks/new
  def new
    @optiontask = Optiontask.new
  end

  # GET /optiontasks/1/edit
  def edit
  end

  # POST /optiontasks or /optiontasks.json
  def create
    @optiontask = Optiontask.new(optiontask_params)

    respond_to do |format|
      if @optiontask.save
        format.html { redirect_to @optiontask, notice: "Optiontask was successfully created." }
        format.json { render :show, status: :created, location: @optiontask }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @optiontask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /optiontasks/1 or /optiontasks/1.json
  def update
    respond_to do |format|
      if @optiontask.update(optiontask_params)
        format.html { redirect_to @optiontask, notice: "Optiontask was successfully updated." }
        format.json { render :show, status: :ok, location: @optiontask }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @optiontask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /optiontasks/1 or /optiontasks/1.json
  def destroy
    @optiontask.destroy
    respond_to do |format|
      format.html { redirect_to optiontasks_url, notice: "Optiontask was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_optiontask
      @optiontask = Optiontask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def optiontask_params
      params.require(:optiontask).permit(:task_id, :optiontask_id)
    end
end
