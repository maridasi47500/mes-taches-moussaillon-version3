class TvseriesController < ApplicationController
  before_action :set_tvseries, only: %i[ actor addepisode show edit update destroy editroles jsonactor]
layout false, only: [:actors,:places,:firstlover,:secondlover,:myfilms,:mytvseries,:mytvseriesparodies,:myfilmparodies,:epochs]
  include MyhelperHelper
  before_action :alltheepochs, only: %i[ epochs ]
  def epochs
  end
def actor
@actors=@tvseries.everyrolesbyactor(params[:actor_id])

end
def jsonactor
render json: @tvseries.tvserieshaveactors.findbyname(params[:name])
end
def saylovers
case params[:tele]
when "tv series"
@tvseries=Tvseries.find(params[:tvseries])
@h=@tvseries.tvserieshaveactors.where(person_id: [params[:firstlover],params[:secondlover]])
Tvserieshavecouple.find_or_create_by(tvserieshaveactor: @h[0],othertvserieshaveactor: @h[1])
redirect_to @tvseries

when "film"
@film=Film.find(params[:films])
@h=@film.phavefilms.where(person_id: [params[:firstlover],params[:secondlover]])
Filmhavecouple.find_or_create_by(phavefilm: @h[0],otherphavefilm: @h[1])
redirect_to @film
when "tv series parody"
@tvseriesparody=Tvseriesparody.find(params[:tvseriesparodies])
@h=@tvseriesparody.tvseriesparodiehaveactors.where(person_id: [params[:firstlover],params[:secondlover]])
Tvseriesparodiehavecouple.find_or_create_by(tvseriesparodiehaveactor: @h[0],othertvseriesparodiehaveactor: @h[1])
redirect_to @tvseriesparody

when "film parody"
@filmparody=Filmparody.find(params[:filmparodies])
@h=@filmparody.filmparodiehaveactors.where(person_id: [params[:firstlover],params[:secondlover]])
Filmparodiehavecouple.find_or_create_by(filmparodiehaveactor: @h[0],otherfilmparodiehaveactor: @h[1])
redirect_to @filmparody
else
redirect_to lovers_tvseries_index_path, notice: "try again."
end
end
def firstlover
@people=Person.findbyid(params[:id])
end
def secondlover
@people=Person.findbyid(params[:id])
end
def mytvseries
@tvseries=Tvseries.findbyid(params[:id])
end
def myfilms
@films=Film.findbyid(params[:id])
end
def myfilmparodies
@filmparodies=Filmparody.findbyid(params[:id])
end
def mytvseriesparodies
@tvseriesparodies=Tvseriesparody.findbyid(params[:id])
end
def places
@places=Place.findbyid(params[:id])
end


  def json
   @t=Tvseries.findbyname(params[:name])
   render json: @t
  end
  def jeudesacteurs
@acteur=Tvserieshaveactor.joins(:surname).select('surnames.*,tvserieshaveactors.*').where.not(surnames:{name: ['',nil]}).sample
@nbacteurs=14
@acteurs1=Tvserieshaveactor.joins(:surname).select('surnames.*,tvserieshaveactors.*').where.not(surnames:{name:[nil,'']}, person_id:@acteur.person_id).sample(@nbacteurs)
@acteurs=@acteurs1+Tvserieshaveactor.where(id: @acteur.id)
    
  end
  def acteurs
    if params['actor'+params[:acteur_id]+'.x']
redirect_to jeudesacteurs_tvseries_index_path, notice: t('display.bravooncemore')

    else
@acteur=Tvserieshaveactor.find(params[:acteur_id])
@nbacteurs=(params[:nbacteurs].to_i - 1)
acteurchoisi=Tvserieshaveactor.all.ids.map {|x| [params["actor#{x}.x"],x]}.select{|x|x[0]}[0][1]

@acteurs1=Tvserieshaveactor.where(id: params[:someactor].split(',')).where.not(id: acteurchoisi).sample(@nbacteurs)
@acteurs=@acteurs1+Tvserieshaveactor.where(id: @acteur.id)
    if @acteurs.length == 1
redirect_to jeudesacteurs_tvseries_index_path, notice: t('display.failmore')
    end
    end
  end
  # GET /tvseries or /tvseries.json
  def editroles
  end
  def actors
    @people = Person.findbyid(params[:id])
  end
  def index
    @tvseries = Tvseries.all.order(:created_at => :desc)
  end

  # GET /tvseries/1 or /tvseries/1.json
  def show
  end

  # GET /tvseries/new
  def new
    @tvseries = Tvseries.new
  end

  # GET /tvseries/1/edit
  def edit
  end

  # POST /tvseries or /tvseries.json
  def create
    @tvseries = Tvseries.new(tvseries_params)

    respond_to do |format|
      if @tvseries.save
        format.html { redirect_to @tvseries, notice: "Tvseries was successfully created." }
        format.json { render :show, status: :created, location: @tvseries }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tvseries.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tvseries/1 or /tvseries/1.json
  def update
    respond_to do |format|
      if @tvseries.update(tvseries_params)
        format.html { redirect_to @tvseries, notice: "Tvseries was successfully updated." }
        format.json { render :show, status: :ok, location: @tvseries }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tvseries.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tvseries/1 or /tvseries/1.json
  def destroy
    @tvseries.destroy
    respond_to do |format|
      format.html { redirect_to tvseries_index_url, notice: "Tvseries was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tvseries
      @tvseries = Tvseries.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lovers_params
     params.permit('firstlover','secondlover','tvseries','films','tvseriesparodies','filmparodies')
    end
    def tvseries_params
      params.require(:tvseries).permit(:name_fr,:name_en,:name_de, :description, :image,:addanactor,:place_ids=>[],:actor_ids=>[],:epoch_ids=>[],:tvserieshaveactors_attributes=>{},:episodes_attributes=>{})
    end
end
