class CountriesController < ApplicationController
  before_action :set_country, only: %i[ show edit update destroy ]
  layout 'mesjeuxvideos', only: [:jeu,:reponses]
  def olympicmedals
    @athlete=Country.searchathlete(*[:sport_id, :sport_group_id,:edition_id, :competition_type_id, :season_id, :athlete_gender, :gender, :event_name_id, :sort].map{|h|olympians_params[h]}).to_a rescue []
#@athlete=[]
    @medal=Olympicmedal.new(olympians_params) rescue Olympicmedal.new
@allmedals=request.post? ? @athlete : Country.mymedalsbycountry

  end
  # GET /countries or /countries.json
  def json
    @countries=Country.findbyname(params[:name])
    render json: @countries
  end
  def reponses

@paysadeviner=Country.find(session[:countrygues])
int=Country.all.ids.map {|x| [params["pays#{x}.x"],x]}.select{|x|x[0]}[0][1]
@choixuser=Country.find(int)
@ok=@paysadeviner == @choixuser
#pour rejouer
@pays = Country.withicons
@pays1=@pays.sample
session[:countrygues]=@pays1.id

  end
  def jeu
@pays = Country.withicons
@pays1=@pays.sample
session[:countrygues]=@pays1.id
  end
  def index
    @countries = Country.all
  end

  # GET /countries/1 or /countries/1.json
  def show
  end

  # GET /countries/new
  def new
    @country = Country.new
  end

  # GET /countries/1/edit
  def edit
  end

  # POST /countries or /countries.json
  def create
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        format.html { redirect_to @country, notice: "Country was successfully created." }
        format.json { render :show, status: :created, location: @country }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countries/1 or /countries/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to @country, notice: "Country was successfully updated." }
        format.json { render :show, status: :ok, location: @country }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1 or /countries/1.json
  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to countries_url, notice: "Country was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def country_params
      params.require(:country).permit(:name_fr,:name_en,:name_de,:mapicon)
    end
    def olympians_params
      params.require("my.scope").permit(:sport_id, :sport_group_id,:edition_id, :competition_type_id, :season_id, :athlete_gender, :gender, :event_name_id, :sort)
    end
end
