class PersonhavelifestateshaverequeststopeopleController < ApplicationController
  before_action :set_personhavelifestateshaverequeststoperson, only: %i[ show edit update destroy ]

  # GET /personhavelifestateshaverequeststopeople or /personhavelifestateshaverequeststopeople.json
  def index
    @personhavelifestateshaverequeststopeople = Personhavelifestateshaverequeststoperson.all
  end

  # GET /personhavelifestateshaverequeststopeople/1 or /personhavelifestateshaverequeststopeople/1.json
  def show
  end

  # GET /personhavelifestateshaverequeststopeople/new
  def new
    @personhavelifestateshaverequeststoperson = Personhavelifestateshaverequeststoperson.new
  end

  # GET /personhavelifestateshaverequeststopeople/1/edit
  def edit
  end

  # POST /personhavelifestateshaverequeststopeople or /personhavelifestateshaverequeststopeople.json
  def create
    @personhavelifestateshaverequeststoperson = Personhavelifestateshaverequeststoperson.new(personhavelifestateshaverequeststoperson_params)

    respond_to do |format|
      if @personhavelifestateshaverequeststoperson.save
        format.html { redirect_to @personhavelifestateshaverequeststoperson, notice: "Personhavelifestateshaverequeststoperson was successfully created." }
        format.json { render :show, status: :created, location: @personhavelifestateshaverequeststoperson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personhavelifestateshaverequeststoperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personhavelifestateshaverequeststopeople/1 or /personhavelifestateshaverequeststopeople/1.json
  def update
    respond_to do |format|
      if @personhavelifestateshaverequeststoperson.update(personhavelifestateshaverequeststoperson_params)
        format.html { redirect_to @personhavelifestateshaverequeststoperson, notice: "Personhavelifestateshaverequeststoperson was successfully updated." }
        format.json { render :show, status: :ok, location: @personhavelifestateshaverequeststoperson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @personhavelifestateshaverequeststoperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personhavelifestateshaverequeststopeople/1 or /personhavelifestateshaverequeststopeople/1.json
  def destroy
    @personhavelifestateshaverequeststoperson.destroy
    respond_to do |format|
      format.html { redirect_to personhavelifestateshaverequeststopeople_url, notice: "Personhavelifestateshaverequeststoperson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personhavelifestateshaverequeststoperson
      @personhavelifestateshaverequeststoperson = Personhavelifestateshaverequeststoperson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def personhavelifestateshaverequeststoperson_params
      params.require(:personhavelifestateshaverequeststoperson).permit(:personhavelifestate_id, :requeststoperson_id)
    end
end
