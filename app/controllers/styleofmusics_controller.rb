class StyleofmusicsController < ApplicationController
  before_action :set_styleofmusic, only: %i[ allpracticers alllisteners show edit update destroy ]
def alllisteners 
    @people=@styleofmusic.listeners

  end
  def allpracticers
    @people=@styleofmusic.practicers
  end
  def listeners 
    @people=Person.findbyid(params[:id])
render layout: false
  end
  def practicers
    @people=Person.findbyid(params[:id])
render layout: false
  end
def json
@j=Styleofmusic.findbyname(params[:name])
render json: @j
end

  # GET /styleofmusics or /styleofmusics.json
  def index
    @styleofmusics = Styleofmusic.all
  end

  # GET /styleofmusics/1 or /styleofmusics/1.json
  def show
  end

  # GET /styleofmusics/new
  def new
    @styleofmusic = Styleofmusic.new
  end

  # GET /styleofmusics/1/edit
  def edit
  end

  # POST /styleofmusics or /styleofmusics.json
  def create
    @styleofmusic = Styleofmusic.new(styleofmusic_params)

    respond_to do |format|
      if @styleofmusic.save
        format.html { redirect_to @styleofmusic, notice: "Styleofmusic was successfully created." }
        format.json { render :show, status: :created, location: @styleofmusic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @styleofmusic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /styleofmusics/1 or /styleofmusics/1.json
  def update
    respond_to do |format|
      if @styleofmusic.update(styleofmusic_params)
        format.html { redirect_to @styleofmusic, notice: "Styleofmusic was successfully updated." }
        format.json { render :show, status: :ok, location: @styleofmusic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @styleofmusic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /styleofmusics/1 or /styleofmusics/1.json
  def destroy
    @styleofmusic.destroy
    respond_to do |format|
      format.html { redirect_to styleofmusics_url, notice: "Styleofmusic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_styleofmusic
      @styleofmusic = Styleofmusic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def styleofmusic_params
      params.fetch(:styleofmusic, {}).permit(:name,:image,:practicer_ids=>[],:listener_ids=>[])
    end
end
