class BodydescriptionsController < ApplicationController
  before_action :set_bodydescription, only: %i[ show edit update destroy ]

  # GET /bodydescriptions or /bodydescriptions.json
  def index
    @bodydescriptions = Bodydescription.all
  end

  # GET /bodydescriptions/1 or /bodydescriptions/1.json
  def show
  end

  # GET /bodydescriptions/new
  def new
    @bodydescription = Bodydescription.new
  end

  # GET /bodydescriptions/1/edit
  def edit
  end

  # POST /bodydescriptions or /bodydescriptions.json
  def create
    @bodydescription = Bodydescription.new(bodydescription_params)

    respond_to do |format|
      if @bodydescription.save
        format.html { redirect_to @bodydescription, notice: "Bodydescription was successfully created." }
        format.json { render :show, status: :created, location: @bodydescription }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bodydescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bodydescriptions/1 or /bodydescriptions/1.json
  def update
    respond_to do |format|
      if @bodydescription.update(bodydescription_params)
        format.html { redirect_to @bodydescription, notice: "Bodydescription was successfully updated." }
        format.json { render :show, status: :ok, location: @bodydescription }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bodydescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bodydescriptions/1 or /bodydescriptions/1.json
  def destroy
    @bodydescription.destroy
    respond_to do |format|
      format.html { redirect_to bodydescriptions_url, notice: "Bodydescription was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bodydescription
      @bodydescription = Bodydescription.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bodydescription_params
      params.require(:bodydescription).permit(:name)
    end
end
