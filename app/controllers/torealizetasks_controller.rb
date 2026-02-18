class TorealizetasksController < ApplicationController
  before_action :set_torealizetask, only: %i[ show edit update destroy ]

  # GET /torealizetasks or /torealizetasks.json
layout false, only: [:tasks,:addnewattitudes,:addattitudes,:attitudes]
def addnewattitudes
end
def addattitudes
end
def attitudes
@attitudes=Attitude.findbyid(params[:id])
end
def tasks
@tasks=Task.findbyid(params[:id])
end
  def index
    @torealizetasks = Torealizetask.all
  end

  # GET /torealizetasks/1 or /torealizetasks/1.json
  def show
  end

  # GET /torealizetasks/new
  def new
    @torealizetask = Torealizetask.new(user: current_user)
  end

  # GET /torealizetasks/1/edit
  def edit
  end

  # POST /torealizetasks or /torealizetasks.json
  def create
    @torealizetask = Torealizetask.new(torealizetask_params)

    respond_to do |format|
      if @torealizetask.save
        format.html { redirect_to @torealizetask, notice: "Torealizetask was successfully created." }
        format.json { render :show, status: :created, location: @torealizetask }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @torealizetask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /torealizetasks/1 or /torealizetasks/1.json
  def update
    respond_to do |format|
      if @torealizetask.update(torealizetask_params)
        format.html { redirect_to @torealizetask, notice: "Torealizetask was successfully updated." }
        format.json { render :show, status: :ok, location: @torealizetask }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @torealizetask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /torealizetasks/1 or /torealizetasks/1.json
  def destroy
    @torealizetask.destroy
    respond_to do |format|
      format.html { redirect_to torealizetasks_url, notice: "Torealizetask was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_torealizetask
      @torealizetask = Torealizetask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def torealizetask_params
      params.require(:torealizetask).permit(:task_id, :user_id,:attitudetakentasks_attributes=>{})
    end
end
