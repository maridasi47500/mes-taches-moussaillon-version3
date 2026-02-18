class TypetasksController < ApplicationController
  before_action :set_typetask, only: %i[ show edit update destroy ]

  # GET /typetasks or /typetasks.json
  def index
    @typetasks = Typetask.all
  end

  # GET /typetasks/1 or /typetasks/1.json
  def show
  end

  # GET /typetasks/new
  def new
    @typetask = Typetask.new
  end

  # GET /typetasks/1/edit
  def edit
  end

  # POST /typetasks or /typetasks.json
  def create
    @typetask = Typetask.new(typetask_params)

    respond_to do |format|
      if @typetask.save
        format.html { redirect_to @typetask, notice: "Typetask was successfully created." }
        format.json { render :show, status: :created, location: @typetask }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @typetask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /typetasks/1 or /typetasks/1.json
  def update
    respond_to do |format|
      if @typetask.update(typetask_params)
        format.html { redirect_to @typetask, notice: "Typetask was successfully updated." }
        format.json { render :show, status: :ok, location: @typetask }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @typetask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /typetasks/1 or /typetasks/1.json
  def destroy
    @typetask.destroy
    respond_to do |format|
      format.html { redirect_to typetasks_url, notice: "Typetask was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_typetask
      @typetask = Typetask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def typetask_params
      params.require(:typetask).permit(:name, :image)
    end
end
