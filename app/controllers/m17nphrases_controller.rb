class M17nphrasesController < ApplicationController
  before_action :set_m17nphrase, only: %i[ show edit update destroy ]
  layout false, only: [:people]

  def people
    @people = Person.findbyid(params[:id])
  end


  # GET /m17nphrases or /m17nphrases.json
  def index
    @m17nphrases = M17nphrase.bypage(params[:page].to_i)
  end

  # GET /m17nphrases/1 or /m17nphrases/1.json
  def show
  end

  # GET /m17nphrases/new
  def new
    @m17nphrase = M17nphrase.new
  end

  # GET /m17nphrases/1/edit
  def edit
  end

  # POST /m17nphrases or /m17nphrases.json
  def create
    @m17nphrase = M17nphrase.new(m17nphrase_params)

    respond_to do |format|
      if @m17nphrase.save
        format.html { redirect_to @m17nphrase, notice: "M17nphrase was successfully created." }
        format.json { render :show, status: :created, location: @m17nphrase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @m17nphrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /m17nphrases/1 or /m17nphrases/1.json
  def update
    respond_to do |format|
      if @m17nphrase.update(m17nphrase_params)
        format.html { redirect_to @m17nphrase, notice: "17-yo phrase (m17n) was successfully updated." }
        format.json { render :show, status: :ok, location: @m17nphrase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @m17nphrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /m17nphrases/1 or /m17nphrases/1.json
  def destroy
    @m17nphrase.destroy
    respond_to do |format|
      format.html { redirect_to m17nphrases_url, notice: "17-yo phrase (m17n) was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_m17nphrase
      @m17nphrase = M17nphrase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def m17nphrase_params
      params.require(:m17nphrase).permit(:content_fr, :content_en, :content_de,:person_ids=>[])
    end
end
