class SelfiesController < ApplicationController
  before_action :set_selfie, only: %i[ show edit update destroy ]
  def albumemotions
    @k=params[:id]
    @emotions=Emotion.where('id'=>@k)
    render layout: false
  end
  def people
    @k=params[:id]
    @people=Person.where('id'=>@k)
    render layout: false
  end
  def albumpeople
    @k=params[:id]
    @people=Person.where('id'=>@k)
    render layout: false
  end


  # GET /selfies or /selfies.json
  def index
    @selfies = Selfie.all
  end

  # GET /selfies/1 or /selfies/1.json
  def show
  end

  # GET /selfies/new
  def new
    @selfie = Selfie.new
  end

  # GET /selfies/1/edit
  def edit
  end

  # POST /selfies or /selfies.json
  def create
    @selfie = Selfie.new(selfie_params)

    respond_to do |format|
      if @selfie.save
        format.html { redirect_to @selfie, notice: "Selfie was successfully created." }
        format.json { render :show, status: :created, location: @selfie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @selfie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selfies/1 or /selfies/1.json
  def update
    respond_to do |format|
      if @selfie.update(selfie_params)
        format.html { redirect_to @selfie, notice: "Selfie was successfully updated." }
        format.json { render :show, status: :ok, location: @selfie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @selfie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selfies/1 or /selfies/1.json
  def destroy
    @selfie.destroy
    respond_to do |format|
      format.html { redirect_to selfies_url, notice: "Selfie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selfie
      @selfie = Selfie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def selfie_params
      params.require(:selfie).permit(:title, :name,:file=>{}, :selfiehavesailors_attributes=>{},:sailor_ids=>[],:photos=>[])
    end
end
