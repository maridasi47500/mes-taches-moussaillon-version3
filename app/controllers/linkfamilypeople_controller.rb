class LinkfamilypeopleController < ApplicationController
  before_action :set_linkfamilyperson, only: %i[ inverseorder show edit update destroy womanman ]
layout false, only: [:people,:otherpeople,:links,:tickets,:thosepeople]
def inverseorder
@linkfamilyperson.inverseorder
redirect_to @linkfamilyperson
end
def tickets
@tickets=Ticket.findbyid(params[:id])
end
def json
@t=Linkfamilyperson.findbyname(params[:name])
render json: @t
end
def thosepeople
  @people=Person.findbyid(params[:id])
end
def sisterbrotherthosepeople
  @people=persoparams['personid'].to_a.combination(2).to_a
  
  g=Familylink.createbrosis(@people)
  redirect_to g
end
def cousinthosepeople
  @people=persoparams['personid'].to_a.combination(2).to_a
  
  g=Familylink.createcousin(@people)
  redirect_to g
end

def womanman
end
def links
@links=Familylink.findbyid(params[:id])
end
def people
@people=Person.findbyid(params[:id])
end
def otherpeople
@people=Person.findbyid(params[:id])
end

  # GET /linkfamilypeople or /linkfamilypeople.json
  def index
    @linkfamilypeople = Linkfamilyperson.all
  end

  # GET /linkfamilypeople/1 or /linkfamilypeople/1.json
  def show
  end

  # GET /linkfamilypeople/new
  def new
    @linkfamilyperson = Linkfamilyperson.new
  end

  # GET /linkfamilypeople/1/edit
  def edit
  end

  # POST /linkfamilypeople or /linkfamilypeople.json
  def create
    @linkfamilyperson = Linkfamilyperson.new(linkfamilyperson_params)

    p @linkfamilyperson.familylink.errors
    p @linkfamilyperson.errors
    p @linkfamilyperson.twoperson.errors

    respond_to do |format|
      if @linkfamilyperson.save
        format.html { redirect_to @linkfamilyperson, notice: "Linkfamilyperson was successfully created." }
        format.json { render :show, status: :created, location: @linkfamilyperson }
      else
    p @linkfamilyperson.familylink.errors
    p @linkfamilyperson.errors
    p @linkfamilyperson.twoperson.errors
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @linkfamilyperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /linkfamilypeople/1 or /linkfamilypeople/1.json
  def update
    respond_to do |format|
      if @linkfamilyperson.update(linkfamilyperson_params)
        format.html { redirect_to @linkfamilyperson, notice: "Linkfamilyperson was successfully updated." }
        format.json { render :show, status: :ok, location: @linkfamilyperson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @linkfamilyperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /linkfamilypeople/1 or /linkfamilypeople/1.json
  def destroy
    @linkfamilyperson.destroy
    respond_to do |format|
      format.html { redirect_to linkfamilypeople_url, notice: "Linkfamilyperson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_linkfamilyperson
      @linkfamilyperson = Linkfamilyperson.find(params[:id])
    end
    def persoparams
      params.require(:perso).permit(:personid => [])
    end

    # Only allow a list of trusted parameters through.
    def linkfamilyperson_params
      params.require(:linkfamilyperson).permit(:person_id, :twoperson_id,:otherperson_id, :familylink_id,:person_attributes=>{}, :otherperson_attributes=>{},:twoperson_attributes=>{},:ticket_ids=>[])
    end
end
