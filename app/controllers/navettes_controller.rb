class NavettesController < ApplicationController
  before_action :set_navette, only: %i[ show edit update destroy ]
  before_action :set_msg, only: %i[ new index ]
def personnavette
    @people=Person.lookforname(params[:name]).fromregiment
    render json: @people

end
def person
@people=Personarmycompagny.findbyid(params[:id])
render layout: false
end

  # GET /navettes or /navettes.json
  def index
    @navettes = Navette.bydate
    render :bydate
  end
def bydate
    @navettes = Navette.bydates(params[:date])
    render :index
end

  # GET /navettes/1 or /navettes/1.json
  def show
  end

  # GET /navettes/new
  def new
    @navette = Navette.new
if Date.today.beginning_of_week+4.days+12.hours+30.minutes > DateTime.now
@navette.go = Date.today.friday
@navette.back = Date.today.friday
end
@message=Date.today.beginning_of_week + 1.day + 10.hours > DateTime.now && Date.today.beginning_of_week + 8.hours < DateTime.now ? "La feuille pour s'inscrire à navette est dispo à la compagnie" : "Aller t'inscrire à la compagnie n'est #{(Date.today.beginning_of_week + 8.hours > DateTime.now || Date.today.beginning_of_week+4.days+12.hours+30.minutes < DateTime.now) ? "pas possible pour le moment." : "pas possible. Tu dois envoyer un e-mail."}"
  end

  # GET /navettes/1/edit
  def edit
  end

  # POST /navettes or /navettes.json
  def create
    @navette = Navette.new(navette_params)

    respond_to do |format|
      if @navette.save
        format.html { redirect_to @navette, notice: "Navette was successfully created." }
        format.json { render :show, status: :created, location: @navette }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @navette.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /navettes/1 or /navettes/1.json
  def update
    respond_to do |format|
      if @navette.update(navette_params)
        format.html { redirect_to @navette, notice: "Navette was successfully updated." }
        format.json { render :show, status: :ok, location: @navette }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @navette.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /navettes/1 or /navettes/1.json
  def destroy
    @navette.destroy
    respond_to do |format|
      format.html { redirect_to navettes_url, notice: "Navette was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_navette
      @navette = Navette.find(params[:id])
    end
def set_msg
@message=Date.today.beginning_of_week + 1.day + 10.hours > DateTime.now && Date.today.beginning_of_week + 8.hours < DateTime.now ? "La feuille pour s'inscrire à navette est dispo à la compagnie" : "Aller t'inscrire à la compagnie n'est #{(Date.today.beginning_of_week + 8.hours > DateTime.now || Date.today.beginning_of_week+4.days+12.hours+30.minutes < DateTime.now) ? "pas possible pour le moment." : "pas possible. Tu dois envoyer un e-mail."}"
end

    # Only allow a list of trusted parameters through.
    def navette_params
      params.require(:navette).permit(:citya_id, :cityb_id, :go, :back,:personarmycompagny_ids=>[])
    end
end
