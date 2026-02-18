class HernothersController < ApplicationController
  before_action :set_hernother, only: %i[ show edit update destroy ]
layout false, only: [:person, :otherperson]
def json
@t=Hernother.findbyname(params[:name])
render json: @t
end

def person
@people=Person.findbyid(params[:id])
end
def otherperson
@people=Person.findbyid(params[:id])
end
  # GET /hernothers or /hernothers.json
  def index
    @hernothers = Hernother.all
  end

  # GET /hernothers/1 or /hernothers/1.json
  def show
  end

  # GET /hernothers/new
  def new
    @hernother = Hernother.new
  end

  # GET /hernothers/1/edit
  def edit
  end

  # POST /hernothers or /hernothers.json
  def create
    @hernother = Hernother.new(hernother_params)

    respond_to do |format|
      if @hernother.save
        format.html { redirect_to @hernother, notice: "Hernother was successfully created." }
        format.json { render :show, status: :created, location: @hernother }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hernother.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hernothers/1 or /hernothers/1.json
  def update
    respond_to do |format|
      if @hernother.update(hernother_params)
        format.html { redirect_to @hernother, notice: "Hernother was successfully updated." }
        format.json { render :show, status: :ok, location: @hernother }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hernother.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hernothers/1 or /hernothers/1.json
  def destroy
    @hernother.destroy
    respond_to do |format|
      format.html { redirect_to hernothers_url, notice: "Hernother was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hernother
      @hernother = Hernother.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hernother_params
      params.require(:hernother).permit(:person_id, :otherperson_id)
    end
end
