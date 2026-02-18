class BecausetasksController < ApplicationController
  before_action :set_becausetask, only: %i[ show edit update destroy ]

  layout false, only: [:task, :othertask]
def othertask
@tasks=Task.findbyid(params[:id])
end
def task
@tasks=Task.findbyid(params[:id])
end
  # GET /becausetasks or /becausetasks.json
  def index
    @becausetasks = Becausetask.all
  end

  # GET /becausetasks/1 or /becausetasks/1.json
  def show
  end

  # GET /becausetasks/new
  def new
    @becausetask = Becausetask.new
  end

  # GET /becausetasks/1/edit
  def edit
  end

  # POST /becausetasks or /becausetasks.json
  def create
    @becausetask = Becausetask.new(becausetask_params)

    respond_to do |format|
      if @becausetask.save
        format.html { redirect_to @becausetask, notice: "Becausetask was successfully created." }
        format.json { render :show, status: :created, location: @becausetask }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @becausetask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /becausetasks/1 or /becausetasks/1.json
  def update
    respond_to do |format|
      if @becausetask.update(becausetask_params)
        format.html { redirect_to @becausetask, notice: "Becausetask was successfully updated." }
        format.json { render :show, status: :ok, location: @becausetask }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @becausetask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /becausetasks/1 or /becausetasks/1.json
  def destroy
    @becausetask.destroy
    respond_to do |format|
      format.html { redirect_to becausetasks_url, notice: "Becausetask was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_becausetask
      @becausetask = Becausetask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def becausetask_params
      params.require(:becausetask).permit(:task_id, :othertask_id)
    end
end
