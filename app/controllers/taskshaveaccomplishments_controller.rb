class TaskshaveaccomplishmentsController < ApplicationController
  before_action :set_taskshaveaccomplishment, only: %i[ show edit update destroy ]

  # GET /taskshaveaccomplishments or /taskshaveaccomplishments.json
  def index
    @taskshaveaccomplishments = Taskshaveaccomplishment.all
  end

  # GET /taskshaveaccomplishments/1 or /taskshaveaccomplishments/1.json
  def show
  end

  # GET /taskshaveaccomplishments/new
  def new
    @taskshaveaccomplishment = Taskshaveaccomplishment.new
  end

  # GET /taskshaveaccomplishments/1/edit
  def edit
  end

  # POST /taskshaveaccomplishments or /taskshaveaccomplishments.json
  def create
    @taskshaveaccomplishment = Taskshaveaccomplishment.new(taskshaveaccomplishment_params)

    respond_to do |format|
      if @taskshaveaccomplishment.save
        format.html { redirect_to @taskshaveaccomplishment, notice: "Taskshaveaccomplishment was successfully created." }
        format.json { render :show, status: :created, location: @taskshaveaccomplishment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @taskshaveaccomplishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taskshaveaccomplishments/1 or /taskshaveaccomplishments/1.json
  def update
    respond_to do |format|
      if @taskshaveaccomplishment.update(taskshaveaccomplishment_params)
        format.html { redirect_to @taskshaveaccomplishment, notice: "Taskshaveaccomplishment was successfully updated." }
        format.json { render :show, status: :ok, location: @taskshaveaccomplishment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @taskshaveaccomplishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taskshaveaccomplishments/1 or /taskshaveaccomplishments/1.json
  def destroy
    @taskshaveaccomplishment.destroy
    respond_to do |format|
      format.html { redirect_to taskshaveaccomplishments_url, notice: "Taskshaveaccomplishment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taskshaveaccomplishment
      @taskshaveaccomplishment = Taskshaveaccomplishment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def taskshaveaccomplishment_params
      params.require(:taskshaveaccomplishment).permit(:task_id, :ticket_id, :sailor_id,:ticket_attributes=>{})
    end
end
