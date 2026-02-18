class LinkspousepeopleController < ApplicationController
  before_action :set_linkspouseperson, only: %i[ show edit update destroy womanman rel ]
layout false, only: [:people,:otherpeople,:links,:tickets,:weaknessid,:forceid,:otherlinkspousepeople]
  include MyhelperHelper
  before_action :alllinkspousepeople, only: %i[ otherlinkspousepeople ]
def rel
@p=Peoplerelation.find(params[:mylover])
Loverrelation.create(peoplerelation: @p,user:current_user,linkspouseperson: @linkspouseperson) if @p
redirect_to @linkspouseperson

end
  def otherlinkspousepeople
  end

def allpeopleincouple
@couples=Linkspouseperson.allpeopleincouple
end
def forcefaiblessetruth
        @int=Weakness.all.ids.map {|x| [params["#{x}weakness.x"],x]}.select{|x|x[0]}[0][1] rescue nil
 @otherperson=Person.find(params[:otherpersonid])
 @person=Person.find(params[:personid])
 @force=Strength.find(params[:forceid])
 @weakness=Weakness.find(@int)
@weaknesscouple=Weaknesscouple.create(weakness: @weakness, force: @force, person: @person, otherperson: @otherperson) || Weaknesscouple.find_by(weakness: @weakness, force: @force, person: @person, otherperson: @otherperson)
end
def weaknessid
  @weakness=Weakness.find(params[:id])
end
def forceid
  @force=Strength.find(params[:id])
end
def firstweakness
      @int=Strength.all.ids.map {|x| [params["#{x}force.x"],x]}.select{|x|x[0]}[0][1] rescue nil
 @otherperson=Person.find(params[:otherpersonid])
 @person=Person.find(params[:personid])
 @force=Person.find(@int)

end
def firstforce
    @int=Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil
 @otherperson=Person.find(@int)
 @person=Person.find(params[:personid])
end
def secondsailor
   @int=Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil
 @person=Person.find(@int)
end
def forcefaiblesse

end
def tickets
@tickets=Ticket.findbyid(params[:id])
end
def json
@t=Linkspouseperson.findbyname(params[:name])
render json: @t
end
def womanman
end

def links
@links=Spouselink.findbyid(params[:id])
end

def people
@people=Person.findbyid(params[:id])
end
def otherpeople
@people=Person.findbyid(params[:id])
end

  # GET /linkspousepeople or /linkspousepeople.json
  def index
    @linkspousepeople = Linkspouseperson.all
  end

  # GET /linkspousepeople/1 or /linkspousepeople/1.json
  def show
  end

  # GET /linkspousepeople/new
  def new
    @linkspouseperson = Linkspouseperson.new
  end

  # GET /linkspousepeople/1/edit
  def edit
  end

  # POST /linkspousepeople or /linkspousepeople.json
  def create
    @linkspouseperson = Linkspouseperson.new(linkspouseperson_params)

    respond_to do |format|
      if @linkspouseperson.save
@linkspouseperson.begindating = Date.new(linkspouseperson_params['begindating(1i)'].to_i,linkspouseperson_params['begindating(2i)'].to_i,1) rescue nil
@linkspouseperson.enddating = Date.new(linkspouseperson_params['enddating(1i)'].to_i,linkspouseperson_params['enddating(2i)'].to_i,1) rescue nil

@linkspouseperson.save
        format.html { redirect_to @linkspouseperson, notice: "Linkspouseperson was successfully created." }
        format.json { render :show, status: :created, location: @linkspouseperson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @linkspouseperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /linkspousepeople/1 or /linkspousepeople/1.json
  def update
    respond_to do |format|
      if @linkspouseperson.update(linkspouseperson_params)
@linkspouseperson.begindating = Date.new(linkspouseperson_params['begindating(1i)'].to_i,linkspouseperson_params['begindating(2i)'].to_i,1) rescue nil
@linkspouseperson.enddating = Date.new(linkspouseperson_params['enddating(1i)'].to_i,linkspouseperson_params['enddating(2i)'].to_i,1) rescue nil

@linkspouseperson.save

        format.html { redirect_to @linkspouseperson, notice: "Linkspouseperson was successfully updated." }
        format.json { render :show, status: :ok, location: @linkspouseperson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @linkspouseperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /linkspousepeople/1 or /linkspousepeople/1.json
  def destroy
    @linkspouseperson.destroy
    respond_to do |format|
      format.html { redirect_to linkspousepeople_url, notice: "Linkspouseperson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_linkspouseperson
      @linkspouseperson = Linkspouseperson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def linkspouseperson_params
      params.require(:linkspouseperson).permit(:twoperson_id,'enddating(2i)','enddating(1i)','begindating(1i)', 'begindating(2i)',:person_id, :otherperson_id, :spouselink_id,:person_attributes=>{}, :otherperson_attributes=>{},:coupleevents_attributes=>{},:twoperson_attributes=>{},:ticket_ids=>[],:otherlinkspouseperson_ids=>[],:myphotos=>[])
    end
end
