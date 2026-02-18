class JinglesController < ApplicationController
  before_action :set_jingle, only: %i[ addsurname show edit update destroy ]
layout false, only: [:radios,:jinglesreactions]
def jinglesreactions
@reactions=Reaction.findbyid(params[:id])
end
def json
@jingles = Jingle.findbyname(params[:name])
render json: @jingles
end
def radios
@radios=Radio.findbyid(params[:id])
end
def allmytasks
      @tasks=Task.find_all_by_id(params[:id])
render layout: false
end

def radiopeople
      id=params[:id]
      @people=Person.where(id: id)
render layout: false
end
def mypeople
      id=params[:id]
      @people=Person.where(id: id)
render layout: false
end


  # GET /jingles or /jingles.json
  def addsurname
    @ps=PostsSurname.new(surname:Surname.new)
    render :edit
  end
  def index
    @jingles = Jingle.mostusedjinglesinposts
  end

  # GET /jingles/1 or /jingles/1.json
  def show
  end

  # GET /jingles/new
  def new
    @jingle = Jingle.new
  end

  # GET /jingles/1/edit
  def edit
  end

  # POST /jingles or /jingles.json
  def create
    @jingle = Jingle.new(jingle_params)

    respond_to do |format|
      if @jingle.save
        format.html { redirect_to @jingle, notice: "Jingle was successfully created." }
        format.json { render :show, status: :created, location: @jingle }
      else
p @jingle.errors
@jingle.audiencemembers.each do |a|
p a.errors
end
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @jingle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jingles/1 or /jingles/1.json
  def update
    respond_to do |format|
      if @jingle.update(jingle_params)
        format.html { redirect_to @jingle, notice: "Jingle was successfully updated." }
        format.json { render :show, status: :ok, location: @jingle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jingle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jingles/1 or /jingles/1.json
  def destroy
    @jingle.destroy
    respond_to do |format|
      format.html { redirect_to jingles_url, notice: "Jingle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jingle
      @jingle = Jingle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jingle_params
      params.require(:jingle).permit(:name_fr,:name_en,:name_de,:name_it, :content_fr,:content_en,:content_de, :content_it, :person_id, :user_id,:audiencemember_ids=>[],:person_ids=>[], :task_ids=>[],:reaction_ids=>[],:radio_ids=>[],:posts_surname_attributes=>{})
    end
end
