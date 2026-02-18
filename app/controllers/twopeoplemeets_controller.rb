class TwopeoplemeetsController < ApplicationController
  before_action :set_twopeoplemeet, only: %i[ show edit update destroy ]
layout false, only: [:person, :otherperson]
def person
@people=Person.findbyid(params[:id])
end
def otherperson
@people=Person.findbyid(params[:id])
end


  # GET /twopeoplemeets or /twopeoplemeets.json
  def index
    @twopeoplemeets = Twopeoplemeet.all
  end

  # GET /twopeoplemeets/1 or /twopeoplemeets/1.json
  def show
  end

  # GET /twopeoplemeets/new
  def new
    @twopeoplemeet = Twopeoplemeet.new
  end

  # GET /twopeoplemeets/1/edit
  def edit
  end

  # POST /twopeoplemeets or /twopeoplemeets.json
  def create
    @twopeoplemeet = Twopeoplemeet.new(twopeoplemeet_params)

    respond_to do |format|
      if @twopeoplemeet.save
        format.html { redirect_to @twopeoplemeet, notice: "Twopeoplemeet was successfully created." }
        format.json { render :show, status: :created, location: @twopeoplemeet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @twopeoplemeet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twopeoplemeets/1 or /twopeoplemeets/1.json
  def update
    respond_to do |format|
      if @twopeoplemeet.update(twopeoplemeet_params)
        format.html { redirect_to @twopeoplemeet, notice: "Twopeoplemeet was successfully updated." }
        format.json { render :show, status: :ok, location: @twopeoplemeet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @twopeoplemeet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twopeoplemeets/1 or /twopeoplemeets/1.json
  def destroy
    @twopeoplemeet.destroy
    respond_to do |format|
      format.html { redirect_to twopeoplemeets_url, notice: "Twopeoplemeet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twopeoplemeet
      @twopeoplemeet = Twopeoplemeet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def twopeoplemeet_params
      params.require(:twopeoplemeet).permit(:person_id, :otherperson_id)
    end
end
