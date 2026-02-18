class SchoolsController < ApplicationController
  before_action :set_school, only: %i[ note noterlycee voirlesphotos show edit update destroy graduated graduation notes ]
  before_action :set_schoolhperson, only: %i[ graduation graduated ]
def notes
end
def voirlesphotos
end
  # GET /schools or /schools.json
def graduation
Persongraduatedschool.create(schoolhperson: @s,date: params[:mydate])
redirect_to @s.school
end
  def graduated
  end
  def people
    @people=Person.findbyid(params[:id])
render layout: false
  end
  def json
    @schools = School.findbyname(params[:name])
    render json: @schools
  end
  def index
    @schools = School.all
  end

  # GET /schools/1 or /schools/1.json
   def note

     if params['image1.x']
	@school.beautifulschools.create!(user:current_user, note: 1,person:PostsSurname.new(posts_surname_params))
	redirect_to notes_school_path(@school.id)
     elsif params['image2.x']
	@school.beautifulschools.create!(user:current_user, note: 2,person:PostsSurname.new(posts_surname_params))
	redirect_to notes_school_path(@school.id)
     elsif params['image3.x']
	@school.beautifulschools.create!(user:current_user, note: 3,person:PostsSurname.new(posts_surname_params))
	redirect_to notes_school_path(@school.id)
     elsif params['image4.x']
	@school.beautifulschools.create!(user:current_user, note: 4,person:PostsSurname.new(posts_surname_params))
	redirect_to notes_school_path(@school.id)
     elsif params['image5.x']
	@school.beautifulschools.create!(user:current_user, note: 5,person:PostsSurname.new(posts_surname_params))
	redirect_to notes_school_path(@school.id)
     end
  end
  def show
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools or /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: "School was successfully created." }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1 or /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: "School was successfully updated." }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1 or /schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url, notice: "School was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end
  def set_schoolhperson
@s=Schoolhperson.find(params[:schoolhperson_id])
  end

    # Only allow a list of trusted parameters through.
    def school_params
      params.fetch(:school, {}).permit(:name,:image,:person_ids=>[], :myphotos=>[])
    end
    def posts_surname_params
params.fetch(:mysurname, {}).permit(:action_name,:whoiam,:new_surname,:surname_id,:surnamedestinataire_id,:stranger_id,:recordingmylanguage, :recordingmyemotion,:content_fr, :content_de, :content_en, :fakename, :other_posts_surname,:destinataire_id,:realname, :avatar, :destinataire,:speaklike_id,:realname_id, :thing_id,:place_id,:sailor_ids,:person_id,:posts_surname_id,:other_posts_surname_id,:profilepic_id,:photoprofilactuelle, :_destroy,:sailor_id,:post_id,:thing_attributes=>{},:posts_surnames_attributes=>{},:surname_attributes=>{},:people_hacked_ids=>[],:recordmywords1=>[], :myownwords1=>[], :contentmyownwords1=>[], :recordmyphrasesandwords1=>[], :myownphrasesandwords1=>[], :contentmyownphrasesandwords1=>[],:recordmyphrasesandwords1=>[],:recordmywords1=>[],:myownphrasesandwords1=>[],:contentmyownphrasesandwords1=>[],:myownwords1=>[],:contentmyownwords1=>[],:recordmyphrasesandwords2=>[],:recordmywords2=>[],:myownphrasesandwords2=>[],:contentmyownphrasesandwords2=>[],:myownwords2=>[],:contentmyownwords2=>[],:other_posts_surname_ids=>[],:realname_attributes=>{},:destinataire_attributes=>{},:avatar_attributes=>{},:surnamedestinataire_attributes=>{},:place_attributes=>{})
    end

end
