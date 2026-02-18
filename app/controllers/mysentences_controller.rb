class MysentencesController < ApplicationController
  before_action :set_mysentence, only: %i[ show edit update destroy editother ]
  def editother
  end
	 
  def ajouterrec

    render layout:false
    	
  end
  def ajouterqch
   @things=Thing.findbyid(params[:id])
    render layout:false
    	
  end
  def thing
   @things=Thing.findbyid(params[:id])
    render layout:false
    	
  end
  def person
   @people=Person.findbyid(params[:id])
    render layout:false
  end


  # GET /mysentences or /mysentences.json
  def index
    @mysentences = Mysentence.all
  end

  # GET /mysentences/1 or /mysentences/1.json
  def show
  end

  # GET /mysentences/new
  def new
    @mysentence = Mysentence.new
  end

  # GET /mysentences/1/edit
  def edit
  end

  # POST /mysentences or /mysentences.json
  def create
    @mysentence = Mysentence.new(mysentence_params)


    respond_to do |format|
      if @mysentence.save
        format.html { redirect_to @mysentence, notice: "Mysentence was successfully created." }
        format.json { render :show, status: :created, location: @mysentence }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mysentence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mysentences/1 or /mysentences/1.json
  def update
    respond_to do |format|
      if @mysentence.update(mysentence_params)
        format.html { redirect_to @mysentence, notice: "Mysentence was successfully updated." }
        format.json { render :show, status: :ok, location: @mysentence }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mysentence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mysentences/1 or /mysentences/1.json
  def destroy
    @mysentence.destroy
    respond_to do |format|
      format.html { redirect_to mysentences_url, notice: "Mysentence was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mysentence
      @mysentence = Mysentence.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mysentence_params
      params.require(:mysentence).permit(:content_fr, :content_en, :content_de,:aboutsomethings_attributes=>{},:aboutsomeones_attributes=>{},:recordings_attributes=>{})
    end
end
