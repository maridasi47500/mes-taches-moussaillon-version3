class DupontsurnamesController < ApplicationController
  before_action :set_dupontsurname, only: %i[ show edit update destroy ]

  # GET /dupontsurnames or /dupontsurnames.json
  def json
    @s=Dupontsurname.findbyname(params[:name])
    render json: @s

  end
  def index
    @dupontsurnames = Dupontsurname.all
  end

  # GET /dupontsurnames/1 or /dupontsurnames/1.json
  def show
  end

  # GET /dupontsurnames/new
  def new
    @dupontsurname = Dupontsurname.new
  end

  # GET /dupontsurnames/1/edit
  def edit
  end

  # POST /dupontsurnames or /dupontsurnames.json
  def create
    @dupontsurname = Dupontsurname.new(dupontsurname_params)

    respond_to do |format|
      if @dupontsurname.save
        format.html { redirect_to @dupontsurname, notice: "Dupontsurname was successfully created." }
        format.json { render :show, status: :created, location: @dupontsurname }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dupontsurname.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dupontsurnames/1 or /dupontsurnames/1.json
  def update
    respond_to do |format|
      if @dupontsurname.update(dupontsurname_params)
        format.html { redirect_to @dupontsurname, notice: "Dupontsurname was successfully updated." }
        format.json { render :show, status: :ok, location: @dupontsurname }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dupontsurname.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dupontsurnames/1 or /dupontsurnames/1.json
  def destroy
    @dupontsurname.destroy
    respond_to do |format|
      format.html { redirect_to dupontsurnames_url, notice: "Dupontsurname was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dupontsurname
      @dupontsurname = Dupontsurname.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dupontsurname_params
      params.require(:dupontsurname).permit(:name)
    end
end
