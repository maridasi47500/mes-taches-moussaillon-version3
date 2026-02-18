class SetoftasksController < ApplicationController
  before_action :set_setoftask, only: %i[ show edit update destroy ]

  # GET /setoftasks or /setoftasks.json
  def index
    @setoftasks = Setoftask.all
  end

  # GET /setoftasks/1 or /setoftasks/1.json
  def show
  end

  # GET /setoftasks/new
  def new
    @setoftask = Setoftask.new
  end

  # GET /setoftasks/1/edit
  def edit
  end

  # POST /setoftasks or /setoftasks.json
  def create
    @setoftask = Setoftask.new(setoftask_params)

    respond_to do |format|
      if @setoftask.save
        format.html { redirect_to @setoftask, notice: "Setoftask was successfully created." }
        format.json { render :show, status: :created, location: @setoftask }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @setoftask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /setoftasks/1 or /setoftasks/1.json
  def update
    respond_to do |format|
      if @setoftask.update(setoftask_params)
        format.html { redirect_to @setoftask, notice: "Setoftask was successfully updated." }
        format.json { render :show, status: :ok, location: @setoftask }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @setoftask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /setoftasks/1 or /setoftasks/1.json
  def destroy
    @setoftask.destroy
    respond_to do |format|
      format.html { redirect_to setoftasks_url, notice: "Setoftask was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setoftask
      @setoftask = Setoftask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def setoftask_params
      params.require(:setoftask).permit(:title,:myowntasks)
    end
end
