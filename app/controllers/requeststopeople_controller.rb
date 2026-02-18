class RequeststopeopleController < ApplicationController
include JsonhelperHelper
include MyhelperHelper
  before_action :set_requeststoperson, only: %i[ show edit update destroy newrequestpeople personabis personbbis askthatway askso bestrequestpeople]
  before_action :find_people, only: %i[   ]
  before_action :find_peoplemyid, only: %i[persona personb personabis personbbis ]
  before_action :find_emoticons, only: %i[ emoticons ]
  before_action :find_youraliases, only: %i[ aliases  ]
  before_action :find_aliases, only: %i[ myaliases ]
  before_action :json_requestsperson, only: %i[ json ]
layout false, only: [:persona,:personb,:aliases,:personabis,:myaliases,:personbbis ,:emoticons]
def newrequestpeople
  1.times { @k=@requeststoperson.requestpeople.build() }

end

def askso
       @requeststopeople=Requeststopersonhaverequestperson.find((Requeststopersonhaverequestperson.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil)) rescue nil
@alias=Alias.find(params[:alias_id])
@emoticon=Emoticon.find(params[:emoticon_id])
@a=Aregoodrequest.create(requeststopersonhaverequestperson: @requeststopeople, alias: @alias, emoticon: @emoticon)
redirect_to @a


end
  # GET /requeststopeople or /requeststopeople.json
  def json
    render json: @requeststopeople
  end
  def myaliases
  end
  def aliases
  end
  def personb
  end
  def persona
  end
  def index
    @requeststopeople = Requeststoperson.all
  end

  # GET /requeststopeople/1 or /requeststopeople/1.json
  def show
  end

  # GET /requeststopeople/new
  def new
    @requeststoperson = Requeststoperson.new
  end

  # GET /requeststopeople/1/edit
  def edit
  end

  # POST /requeststopeople or /requeststopeople.json
  def create
    @requeststoperson = Requeststoperson.new(requeststoperson_params)

    respond_to do |format|
      if @requeststoperson.save
        format.html { redirect_to @requeststoperson, notice: "Requeststoperson was successfully created." }
        format.json { render :show, status: :created, location: @requeststoperson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @requeststoperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requeststopeople/1 or /requeststopeople/1.json
  def update
    respond_to do |format|
      if @requeststoperson.update(requeststoperson_params)
        format.html { redirect_to @requeststoperson, notice: "Requeststoperson was successfully updated." }
        format.json { render :show, status: :ok, location: @requeststoperson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @requeststoperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requeststopeople/1 or /requeststopeople/1.json
  def destroy
    @requeststoperson.destroy
    respond_to do |format|
      format.html { redirect_to requeststopeople_url, notice: "Requeststoperson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_aliases
      @person=Person.find(params[:id])
      @aliases=Alias.findorcreatefrompersoniduser(params[:id],current_user)
      
    end
    def find_people
      @people=Person.findbyid(params[:id])
    end
    def set_requeststoperson
      @requeststoperson = Requeststoperson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def requeststoperson_params
      params.require(:requeststoperson).permit(:alias_id,:requestperson_id, :content_fr, :content_en, :content_de,:requestperson_attributes=>{},:myrequestpeople_attributes=>{},:requestpeople_attributes=>{})
    end
end
