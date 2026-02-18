class ReactionsController < ApplicationController
  before_action :set_reaction, only: %i[ show edit update destroy ]

  # GET /reactions or /reactions.json
def jsonreactions
@reactions=Reaction.mybestreactions(params[:name])
render json: @reactions
end
def json
@reactions=Reaction.findbyname2(params[:name])
render json: @reactions
end
  def mypeople
    @people=Person.where(id: params[:id])
    @field=params[:field]

    if params[:o]
    render :mypeoplebis, layout: false

    else
    render layout: false
    end
  end

  def index
      @reactions=Reaction.bypage(params[:page].to_i)

  end
  def updatethisreaction
    @reaction = Reaction.find(params[:id])
    @reaction.update(updated_at: DateTime.now)
    if params[:people]
    @reaction.surnames.each_with_index do |x,i| 
      t=x.name.strip.squish
        @people=Person.where('lower(name) like ?',"%#{t.downcase.gsub(' ','%')}%")
    if @people.length > 0
      @reaction.reactivepeople[i].person ||= @people[0]
      @reaction.reactivepeople[i].save
    end
    end
    end

  end

  # GET /reactions/1 or /reactions/1.json
  def show
    @p = @reaction.reactivepeople.pluck(:id)
    
    @collections = Collection.all.left_joins(:people).where('people.id' => @p).distinct.select('collections.*')
  end

  # GET /reactions/new
  def new

    @nbpeople=params[:mypeople].map{|g|g.to_i > 0 ? g.to_i : 1}
    @nbpeopletotal = @nbpeople.sum

    @reaction = Reaction.new(reaction_id: params[:reactionid])
    @namesinit=@reaction.namesinit
nb= params[:mypeople].count('') - params[:mypeople].count('0')  - params[:mypeople].count('1')
    @myreaction = params[:reactionid] || @reaction.guessreactionid
    saveindex=[]
p @nbpeople
p @namesinit
    @nbpeople.each_with_index do |y,id1|
p id1, "nb item"
 
@myname= @namesinit[id1]
        if y.to_i > 1
        saveindex << id1
        @group=@reaction.severalpeoplestories.new(myid: id1)
      (y.to_i).times do
        
        a=@group.posts_surnames.new(surname: Surname.new(name: @myname), profilepic: Profilepicture.new)
        p a
        end
        else
      a=@reaction.reactivepeople.new(surname: Surname.new(name: @myname), profilepic: Profilepicture.new)
      p a
    
      end

    end
  rescue NoMethodError
k=ReactionsText.find(params[:reactionid])
redirect_to k, notice: "Erreur : Aucun nom ou surnom n'est enregistré dans la base"
  end

  # GET /reactions/1/edit
  def edit
    @myreaction = params[:reactionid] || @reaction.guessreactionid

  end

  # POST /reactions or /reactions.json
  def create
    @reaction = Reaction.new(reaction_params)

    respond_to do |format|
      if @reaction.save
        format.html { redirect_to @reaction, notice: "Sentence with sailors was successfully created." }
        format.json { render :show, status: :created, location: @reaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reaction.errors, status: :unprocessable_entity }
      end
    end
    rescue
    p @reaction
    p @reaction.errors
  end

  # PATCH/PUT /reactions/1 or /reactions/1.json
  def update
    respond_to do |format|
      if @reaction.update(reaction_params)
        format.html { redirect_to @reaction, notice: "Sentence with sailors was successfully updated." }
        format.json { render :show, status: :ok, location: @reaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reactions/1 or /reactions/1.json
  def destroy
    @reaction.destroy
    respond_to do |format|
      format.html { redirect_to reactions_url, notice: "Reaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reaction
      @reaction = Reaction.find(params[:id])
      if !@reaction.speaker
        @reaction.speaker=PostsSurname.new(surname: Surname.new, profilepic: Profilepicture.new)
      end
    end

    # Only allow a list of trusted parameters through.
    def reaction_params
      params.fetch(:reaction,{}).permit(:everypeople,:emotion_id,:reaction_id,:groupby,:surname,:name,:opposite,:reactingperson_ids=>[],:speaker_attributes=>{},:reactivepeople_attributes=>{},:severalpeoplestories_attributes=>{})
    end
end
