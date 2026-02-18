class CitiesController < ApplicationController

  before_action :set_city, only: %i[ myjobcity show edit update destroy jobcity lookforcity addpeoplecity addthosepeoplecity villagephotos searchpeople ]
  before_action :set_person, only: %i[ myjobcity jobcity lookforcity ]
  before_action :set_epoch, only: %i[ addpeoplecity addthosepeoplecity ]
  before_action :set_peoplecity, only: %i[ addthosepeoplecity ]
layout false, only: [:state,:lookforcity,:city,:country,:nationality]
def addpeoplejob
@city=City.find(params[:city_id])
@job=Job.find(params[:job_id])
@person=Person.find Person.all.ids.select{|h|params["#{h}person.x"]}[0]
@p=Peoplehavejob.find_or_create_by person_id: @person.id,job_id: @job.id
@p1=Peoplejobcity.find_or_create_by peoplehavejob_id: @p.id, city_id: @city.id
end
def searchpeople
end
def lookforpeople
@person=Person.find(params[:id])
render layout: false
end
def lookforsomebody
@person=Person.find(params[:person_id])
@city=City.find(params[:id])

@mypersonincity=PeopleCity.find_or_create_by(person: @person, city: @city)
redirect_to searchpeople_city_path(@city.id),notice: "La bienvenue à #{@person.name} ! #{current_user.name}, connaissez vous d'autres personnes de #{@city.name} ?"
end
def lookforperson
@person=Person.find(params[:id])
@city=City.find(params[:city_id])
render layout: false
end

  # GET /cities or /cities.json
def villagephotos
end

def jobcitydelete
@people=PeopleCity.find(params[:personcityid])
@city=@people.city
@person=@people.person
@people.delete
end
def peoplehavecities
@people_cities=PeopleCity.bypage(params[:page])
end
def state
@states=State.findbyid(params[:id])
end

def country
@countries=Country.findbyid(params[:id])
end
def nationality
@nationalities=Nationality.findbyid(params[:id])
end
def city
@cities=City.findbyid(params[:id])
end
def addthosepeoplecity
@peoplecitiesepoch=Peoplecitiesepoch.find_or_create_by(people_city:@peoplecity, epoch:@epoch)
redirect_to person_city_epoch_path(person_id: @person.id, city_id:@city.id,id:@epoch.id)

end
def addpeoplecity
end
def lookforcity
end
def myjobcity
@mypersonincity=PeopleCity.find_or_create_by(person: @person, city: @city)
if @mypersonincity.update(people_city_params)
redirect_to jobcity_person_city_path(id: @city.id, person_id: @person.id)
end
end
def jobcity
@mypersonincity=PeopleCity.find_or_create_by(person: @person, city: @city)
end
def json
@a=City.findbyname(params[:name])
render json: @a
end
  def index
    @cities = City.all
  end

  # GET /cities/1 or /cities/1.json
  def show
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities or /cities.json
  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: "City was successfully created." }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cities/1 or /cities/1.json
  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city, notice: "City was successfully updated." }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1 or /cities/1.json
  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url, notice: "City was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end
    def set_person
      @person = Person.find(params[:person_id]) rescue nil
    end
    def set_epoch
      @epoch = Epoch.find(params[:epoch_id]) rescue nil
    end
    def set_peoplecity
      @city = City.find(params[:id])
                @personid=Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil
                @person=Person.find(@personid)
           @peoplecity=PeopleCity.find_or_create_by(person_id:@personid,city:@city)
    end

    # Only allow a list of trusted parameters through.
    def people_city_params
      params.require(:people_city).permit(:myphotos=>[])
    end

    def city_params
      params.require(:city).permit(:name_de,:name_en,:name_it,:name_fr,:nationality_id,:city_id,:state_id,:country_id,:mytitle,:myphotos=>[])
    end
end
