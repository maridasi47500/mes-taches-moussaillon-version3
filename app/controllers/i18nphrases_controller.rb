class I18nphrasesController < ApplicationController
  before_action :set_i18nphrase, only: %i[ show edit update destroy ]
  layout false, only: [:people,:things,:places,:cities,:aliases,:otheri18nphrases]

  def otheri18nphrases
    @i18nphrases = I18nphrase.findbyid(params[:id])
  end
  def aliases
      @aliases=Alias.findorcreatefrompersoniduser(params[:id],current_user)

  end
  def cities
    @cities = City.findbyid(params[:id])
  end
  def things
    @things = Thing.findbyid(params[:id])
  end
  def places
    @places = Place.findbyid(params[:id])
  end
  def people
    @people = Person.findbyid(params[:id])
  end
  def json
    @i=I18nphrase.findbyname(params[:name])
    render json: @i
  end
  # GET /i18nphrases or /i18nphrases.json
  def index
    @i18nphrases = I18nphrase.bypage(params[:page].to_i)
  end

  # GET /i18nphrases/1 or /i18nphrases/1.json
  def show
  end

  # GET /i18nphrases/new
  def new
    @i18nphrase = I18nphrase.new
  end

  # GET /i18nphrases/1/edit
  def edit
  end

  # POST /i18nphrases or /i18nphrases.json
  def create
    @i18nphrase = I18nphrase.new(i18nphrase_params)

    respond_to do |format|
      if @i18nphrase.save
        format.html { redirect_to @i18nphrase, notice: "Your 18-years-old phrase (I18n) was successfully created." }
        format.json { render :show, status: :created, location: @i18nphrase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @i18nphrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /i18nphrases/1 or /i18nphrases/1.json
  def update
    respond_to do |format|
      if @i18nphrase.update(i18nphrase_params)
        format.html { redirect_to @i18nphrase, notice: "Your 18-years-old phrase (I18n) was successfully updated." }
        format.json { render :show, status: :ok, location: @i18nphrase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @i18nphrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /i18nphrases/1 or /i18nphrases/1.json
  def destroy
    @i18nphrase.destroy
    respond_to do |format|
      format.html { redirect_to i18nphrases_url, notice: "your 18-years-old phrase (I18n) was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_i18nphrase
      @i18nphrase = I18nphrase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def i18nphrase_params
      params.require(:i18nphrase).permit(:content_fr, :content_en, :content_de,:person_ids=>[],:thing_ids=>[], :place_ids=>[],:city_ids=>[],:alias_ids=>[],:otheri18nphrase_ids=>[])
    end
end
