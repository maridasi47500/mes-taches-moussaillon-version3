class AboutsomeonegossipsController < ApplicationController
  before_action :set_aboutsomeonegossip, only: %i[ about notabout before during after show edit update destroy ]
before_action :reactionbyid, only: [:after,:during,:before,:reactionid]
layout false, only: [:tvseries,:after,:before,:during,:reactionid,:abouthem]
def tvseries
@tvseries=Tvseries.findbyid(params[:id])
end
def json
@gossips=Aboutsomeonegossip.findbyname(params[:name])
render json: @gossips
end

def after
end
def during
end
def before
end
def reactionid

end
def aboutthem
@people=Person.find1pplbyid(params[:id])
end
  def about
    @people = Person.where(id: params[:personid])
    @a=Gossipaboutwho.create(person: @people[0], aboutsomeonegossip_id:params[:id])
p @a.errors
    render partial: "people/personcard", collection: @aboutsomeonegossip.aboutthosepeople, as: :person, layout: false
  end
  def notabout
    @people = Person.where(id: params[:personid])
    @a=Gossipnotaboutwho.create(person: @people[0], aboutsomeonegossip_id:params[:id])
    p @a.errors
    render partial: "people/personcard", collection: @aboutsomeonegossip.aboutthosepeople, as: :person, layout: false
  end
  def index
  @g=params[:page].to_i
    @aboutsomeonegossips = Aboutsomeonegossip.bypage(params[:page].to_i)


    end
  def before
    
  end
  def during
    
  end
  def after
    
  end
  # GET /aboutsomeonegossips/1 or /aboutsomeonegossips/1.json
  def show
if params['entendu.x']
@aboutsomeonegossip.entendugossips << [current_user]
elsif params['comprendpas.x']
@aboutsomeonegossip.comprendpasgossips << [current_user]
elsif params['lu.x']
@aboutsomeonegossip.lugossips << [current_user]
elsif params['aime.x']
@aboutsomeonegossip.aimegossips << [current_user]
elsif params['aimepas.x']
@aboutsomeonegossip.aimepasgossips << [current_user]
elsif params['com.x']
Commentrumeur.create(user: current_user, gossip_id: params[:id], content: params[:comment])
elsif params['1.x']
Noterumeur.create(user: current_user, gossip_id: params[:id], note: 1)
elsif params['2.x']
Noterumeur.create(user: current_user, gossip_id: params[:id], note: 2)
elsif params['3.x']
Noterumeur.create(user: current_user, gossip_id: params[:id], note: 3)
elsif params['4.x']
Noterumeur.create(user: current_user, gossip_id: params[:id], note: 4)
elsif params['5.x']
Noterumeur.create(user: current_user, gossip_id: params[:id], note: 5)
  end
rescue ActiveRecord::RecordInvalid
  end

  # GET /aboutsomeonegossips/new
  def new
    @aboutsomeonegossip = Aboutsomeonegossip.new
    @aboutsomeonegossip.anaphors.new
    
  end

  # GET /aboutsomeonegossips/1/edit
  def edit
    if params[:explain] == "true"
    @aboutsomeonegossip.anaphors.new
    end
  end

  # POST /aboutsomeonegossips or /aboutsomeonegossips.json
  def create
    @aboutsomeonegossip = Aboutsomeonegossip.new(aboutsomeonegossip_params)

    respond_to do |format|
      if @aboutsomeonegossip.save
        format.html { redirect_to @aboutsomeonegossip, notice: "Have you heard that, honey? #{@aboutsomeonegossip.content}" }
        format.json { render :show, status: :created, location: @aboutsomeonegossip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @aboutsomeonegossip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aboutsomeonegossips/1 or /aboutsomeonegossips/1.json
  def update
    respond_to do |format|
      if @aboutsomeonegossip.update(aboutsomeonegossip_params)
        format.html { redirect_to @aboutsomeonegossip, notice: "Have you heard that, honey? #{@aboutsomeonegossip.content}" }
        format.json { render :show, status: :ok, location: @aboutsomeonegossip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @aboutsomeonegossip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aboutsomeonegossips/1 or /aboutsomeonegossips/1.json
  def destroy
    @aboutsomeonegossip.destroy
    respond_to do |format|
      format.html { redirect_to aboutsomeonegossips_url, notice: "Forget about it." }
      format.json { head :no_content }
    end
  end

  private
def reactionbyid
@reactions=Reaction.reactionbyid(params[:id])
end
    # Use callbacks to share common setup or constraints between actions.
    def set_aboutsomeonegossip
      @aboutsomeonegossip = Aboutsomeonegossip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def aboutsomeonegossip_params
      params.require(:aboutsomeonegossip).permit(:reaction_id,:true,:content_fr,:content_en,:content_de,:duringgossip_ids=>[],:aftergossip_ids=>[],:beforegossip_ids=>[],:aboutthoseperson_ids=>[],:tvseries_ids=>[],:anaphors_attributes=> {}, :displaygossip_attributes=>{})

    end
end
