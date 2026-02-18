class TwopeopleController < ApplicationController
  before_action :set_twoperson, only: %i[ show edit update destroy ]

  # GET /twopeople or /twopeople.json
def json
@twopeople=Twoperson.findbyname(params[:name])
render json: @twopeople
end
  def person1
  end
  def person2
                @personid=Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil

  end
  def comparetwo
@p1id=params[:person1id]||params[:persid]
@person1=Person.find(@p1id) 
                @personid=params[:person2id]||Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil
@person2=Person.find(@personid)
@twopeople=Twoperson.find_or_create_by(person: @person2, otherperson: @person1) || Twoperson.find_or_create_by(person: @person1, otherperson: @person2)
@people=[@person1,@person2]
  end
  def comparetwopeople
@person1=Person.find(params[:person1id]) rescue nil
@person2=Person.find(params[:person2id]) rescue nil
@twopeople=Twoperson.find_by(person: @person1, otherperson: @person2)||Twoperson.find_by(person: @person2, otherperson: @person1)
                @person=Person.find((Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil)) rescue nil
                @city=City.find((City.all.ids.map {|x| [params["#{x}city.x"],x]}.select{|x|x[0]}[0][1] rescue nil)) rescue nil
                @job=Job.find((Job.all.ids.map {|x| [params["#{x}job.x"],x]}.select{|x|x[0]}[0][1] rescue nil)) rescue nil
                @company=Company.find((Company.all.ids.map {|x| [params["#{x}company.x"],x]}.select{|x|x[0]}[0][1] rescue nil)) rescue nil
@twopeople.jobs << [@job] if @job
@twopeople.cities << [@city] if @city
@twopeople.companies << [@company] if @company


end
  def index
    @twopeople = Twoperson.all
  end

  # GET /twopeople/1 or /twopeople/1.json
  def show
  end

  # GET /twopeople/new
  def new
    @twoperson = Twoperson.new
  end

  # GET /twopeople/1/edit
  def edit
  end

  # POST /twopeople or /twopeople.json
  def create
    @twoperson = Twoperson.new(twoperson_params)

    respond_to do |format|
      if @twoperson.save
        format.html { redirect_to @twoperson, notice: "Twoperson was successfully created." }
        format.json { render :show, status: :created, location: @twoperson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @twoperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twopeople/1 or /twopeople/1.json
  def update
    respond_to do |format|
      if @twoperson.update(twoperson_params)
        format.html { redirect_to @twoperson, notice: "Twoperson was successfully updated." }
        format.json { render :show, status: :ok, location: @twoperson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @twoperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twopeople/1 or /twopeople/1.json
  def destroy
    @twoperson.destroy
    respond_to do |format|
      format.html { redirect_to twopeople_url, notice: "Twoperson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twoperson
      @twoperson = Twoperson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def twoperson_params
      params.require(:twoperson).permit(:person_id, :otherperson_id)
    end
end
