class PeopledidwellgrouptasksController < ApplicationController
  before_action :set_peopledidwellgrouptask, only: %i[ show edit update destroy ]

  # GET /peopledidwellgrouptasks or /peopledidwellgrouptasks.json
  def index
    @peopledidwellgrouptasks = Peopledidwellgrouptask.all
  end

  # GET /peopledidwellgrouptasks/1 or /peopledidwellgrouptasks/1.json
  def show
  end

  # GET /peopledidwellgrouptasks/new
  def new
    @peopledidwellgrouptask = Peopledidwellgrouptask.new
  end

  # GET /peopledidwellgrouptasks/1/edit
  def edit
  end

  # POST /peopledidwellgrouptasks or /peopledidwellgrouptasks.json
  def create
    @peopledidwellgrouptask = Peopledidwellgrouptask.new(peopledidwellgrouptask_params)

    respond_to do |format|
      if @peopledidwellgrouptask.save
        format.html { redirect_to @peopledidwellgrouptask, notice: "Peopledidwellgrouptask was successfully created." }
        format.json { render :show, status: :created, location: @peopledidwellgrouptask }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @peopledidwellgrouptask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /peopledidwellgrouptasks/1 or /peopledidwellgrouptasks/1.json
  def update
    respond_to do |format|
      if @peopledidwellgrouptask.update(peopledidwellgrouptask_params)
        format.html { redirect_to @peopledidwellgrouptask, notice: "Peopledidwellgrouptask was successfully updated." }
        format.json { render :show, status: :ok, location: @peopledidwellgrouptask }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @peopledidwellgrouptask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peopledidwellgrouptasks/1 or /peopledidwellgrouptasks/1.json
  def destroy
    @peopledidwellgrouptask.destroy
    respond_to do |format|
      format.html { redirect_to peopledidwellgrouptasks_url, notice: "Peopledidwellgrouptask was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peopledidwellgrouptask
      @peopledidwellgrouptask = Peopledidwellgrouptask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def peopledidwellgrouptask_params
      params.require(:peopledidwellgrouptask).permit(:user_id, :rating, :sailorgrouptask_id)
    end
end
