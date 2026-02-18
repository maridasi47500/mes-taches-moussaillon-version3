class TasktypesController < ApplicationController
  before_action :set_tasktype, only: %i[ show edit update destroy ]

  # GET /tasktypes or /tasktypes.json
  def index
    @tasktypes = Tasktype.all
  end

  # GET /tasktypes/1 or /tasktypes/1.json
  def show
  end

  # GET /tasktypes/new
  def new
    @tasktype = Tasktype.new
  end

  # GET /tasktypes/1/edit
  def edit
  end

  # POST /tasktypes or /tasktypes.json
  def create
    @tasktype = Tasktype.new(tasktype_params)

    respond_to do |format|
      if @tasktype.save
        format.html { redirect_to @tasktype, notice: "Tasktype was successfully created." }
        format.json { render :show, status: :created, location: @tasktype }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tasktype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasktypes/1 or /tasktypes/1.json
  def update
    respond_to do |format|
      if @tasktype.update(tasktype_params)
        format.html { redirect_to @tasktype, notice: "Tasktype was successfully updated." }
        format.json { render :show, status: :ok, location: @tasktype }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tasktype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasktypes/1 or /tasktypes/1.json
  def destroy
    @tasktype.destroy
    respond_to do |format|
      format.html { redirect_to tasktypes_url, notice: "Tasktype was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tasktype
      @tasktype = Tasktype.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tasktype_params
      params.require(:tasktype).permit(:name, :image)
    end
end
