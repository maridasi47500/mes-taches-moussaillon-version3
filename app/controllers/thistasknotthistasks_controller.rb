class ThistasknotthistasksController < ApplicationController
  before_action :set_thistasknotthistask, only: %i[ show edit update destroy ]
layout false, only: [:task, :othertask]
def json
@t=Thistasknotthistask.findbyname(params[:name])
render json: @t
end
def task
@tasks=Task.findbyid(params[:id])
end
def othertask
@tasks=Task.findbyid(params[:id])
end

  # GET /thistasknotthistasks or /thistasknotthistasks.json
  def index
    @thistasknotthistasks = Thistasknotthistask.all
  end

  # GET /thistasknotthistasks/1 or /thistasknotthistasks/1.json
  def show
  end

  # GET /thistasknotthistasks/new
  def new
    @thistasknotthistask = Thistasknotthistask.new
  end

  # GET /thistasknotthistasks/1/edit
  def edit
  end

  # POST /thistasknotthistasks or /thistasknotthistasks.json
  def create
    @thistasknotthistask = Thistasknotthistask.new(thistasknotthistask_params)

    respond_to do |format|
      if @thistasknotthistask.save
        format.html { redirect_to @thistasknotthistask, notice: "Thistasknotthistask was successfully created." }
        format.json { render :show, status: :created, location: @thistasknotthistask }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @thistasknotthistask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thistasknotthistasks/1 or /thistasknotthistasks/1.json
  def update
    respond_to do |format|
      if @thistasknotthistask.update(thistasknotthistask_params)
        format.html { redirect_to @thistasknotthistask, notice: "Thistasknotthistask was successfully updated." }
        format.json { render :show, status: :ok, location: @thistasknotthistask }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @thistasknotthistask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thistasknotthistasks/1 or /thistasknotthistasks/1.json
  def destroy
    @thistasknotthistask.destroy
    respond_to do |format|
      format.html { redirect_to thistasknotthistasks_url, notice: "Thistasknotthistask was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thistasknotthistask
      @thistasknotthistask = Thistasknotthistask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def thistasknotthistask_params
      params.require(:thistasknotthistask).permit(:task_id, :othertask_id)
    end
end
