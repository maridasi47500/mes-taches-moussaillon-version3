class PostsSurnamesController < ApplicationController
  before_action :set_posts_surname, only: [:posts,:nouvelaidememoire,:show, :edit, :update, :destroy,:editerceluila]
  before_action :authenticate_user!
  #rescue_from NoMethodError, :with => :problemesdanslehacking

  layout false, only: %i[ otherpostssurnames namesdestinataire names mypics mystuff ps1 ps2 mypeople nouvelaidememoire selectaplacetops addaplacetops myavatars renderone] 
  include MyhelperHelper
  before_action :allpostssurnames, only: %i[ otherpostssurnames ]
  def otherpostssurnames
  end


  # GET /posts_surnames
  # GET /posts_surnames.json
def json
@p=PostsSurname.findbyname(params[:name])
render json: @p
end
def namesdestinataire
      @surnames=Surname.find_by_id(params[:id])
end
def names
      @surnames=Surname.find_by_id(params[:id])
end

def mypics
      id=params[:id]
      @profilepictures=Profilepicture.where(id: id)
end
def mystuff
      id=params[:id]
      @things=Thing.where(id: id)
end

    def ps1
      @n=params[:id]
      @people=PostsSurname.where(id: @n).mysurnames

    end
    def ps2
      @n=params[:id]
      @people=PostsSurname.where(id: @n).mysurnames

    end

  def mypeople
    @people=Person.where(id: params[:id])
    @field=params[:field]
  end
  def posts
  end
  def nouvelaidememoire
    begin
    @posts_surname.update(posts_surname_params)
	p @posts_surname
    rescue => e
      p e.message

    @posts_surname=PostsSurname.new
    end

    render locals: {ps:@posts_surname}
  end
  def selectaplacetops
          @n=params[:name]
      @o='%'+@n.gsub(' ','%').downcase+'%'
        @places=Place.where("lower(name) like ?",@o)
  end
  def addaplacetops
  end
  def allps
          @n=params[:name]
      @o='%'+@n.gsub(' ','%').downcase+'%'
        @people=PostsSurname.findthem(@o)
      render json: @people

  end
  def psa
          @n=params[:name]
      @o='%'+@n.gsub(' ','%').downcase+'%'
        @people=PostsSurname.findthem(@o)
      render json: @people

  end
  def psb
          @n=params[:name]
      @o='%'+@n.gsub(' ','%').downcase+'%'
        @people=PostsSurname.findthem(@o)
      render json: @people

  end
  def myavatars
@fieldname=params[:fieldname]
@n='%'+params[:name].to_s.gsub(' ','%')+'%'
@cn=params[:classname]
case @cn
when 'Person'
@people = Person.where('name like ?',@n).notfrommovies.notfromtvseries(["cleo","bethy"])
when 'Profilepicture'
@people = Profilepicture.where('nameimage like ?',@n)
end

  end
  def renderone
    p post_params[:my_posts_surnames_attributes].values
    p post_params[:my_posts_surnames_attributes]
    p post_params[:my_posts_surnames_attributes]['0']
    value= post_params[:my_posts_surnames_attributes]['0'].to_h.except(:_destroy)
    p value
    @posts_surname = PostsSurname.new
    @posts_surname.assign_attributes(value)
    @posts_surname.save(validate: false)
    p @posts_surname
    render inline: "<%= render partial: 'posts_surnames/mysailors', collection: [@posts_surname], as: :posts_surname, locals: {i: 0} %>"
  rescue
    @posts_surname.save(validate: false)
    render inline: "<%= render partial: 'posts_surnames/mysailors', collection: [@posts_surname], as: :posts_surname, locals: {i: 0} %>"
  end
  def index
    @posts_surnames = PostsSurname.all
  end
  def hacksomeone
    @ps=PostsSurname.find(params[:id])
    @moussaillons = Person.all
    respond_to do |format|
        format.js 
    end
  end
  # GET /posts_surnames/1
  # GET /posts_surnames/1.json
  def show
    render locals: {posts_surname: @posts_surname}
  end

  # GET /posts_surnames/new
  def new
    @posts_surname = PostsSurname.new
  end

  # GET /posts_surnames/1/edit
  def edit
        postsurname=params[:id]
    @postsurname=@newpostsurname =PostsSurname.find(postsurname)
    @post = @postsurname.post
    if params[:ajax]
    render partial: "posts_surnames/form1", locals: {post: @posts_surname}
    else
    render locals: {posts_surname: @posts_surname}
    end
  end
  def editerceluila
        postsurname=params[:id]
    @postsurname=@newpostsurname =PostsSurname.find(postsurname)
    @post = @postsurname.post
    moussaillon =@postsurname.sailor
    #@newpostsurname =@postsurname.posts_surnames.new(sailor: moussaillon,post: @post,surname:Surname.new,place: Place.new,person:moussaillon)
        nbsailors=@newpostsurname.post.moussaillonsdecepost.count
    nbpeople=@newpostsurname.people.count
    diff=(nbsailors-nbpeople).abs
    if nbsailors > nbpeople
      diff.times {@newpostsurname.people.new}
    elsif nbsailors < nbpeople
      @newpostsurname.people.last(diff).destroy

    end

    render :edit
  end

  # POST /posts_surnames
  # POST /posts_surnames.json
  def create
    @posts_surname = PostsSurname.new(posts_surname_params)

    respond_to do |format|
      if @posts_surname.save
        format.html { redirect_to @posts_surname, notice: 'Posts surname was successfully created.' }
        format.json { render :show, status: :created, location: @posts_surname }
      else
        format.html { render :new }
        format.json { render json: @posts_surname.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts_surnames/1
  # PATCH/PUT /posts_surnames/1.json
  def update
      @postssurname = PostsSurname.find(params[:id])

    respond_to do |format|
      if @posts_surname.update(posts_surname_params)
        format.html { redirect_to @posts_surname, notice: 'Posts surname was successfully updated.' }
        format.json { render :show, status: :ok, location: @posts_surname }
      else
        format.html { render :edit }
        format.json { render json: @posts_surname.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts_surnames/1
  # DELETE /posts_surnames/1.json
  def destroy
    @post=@posts_surname.post
    @posts_surname.destroy
    
    respond_to do |format|
      format.html { redirect_to usurp_post_path(id: @post.id,idsurname: @post.posts_surnames.where.not(id:nil).last.id), notice: 'Posts surname was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def problemesdanslehacking
        redirect_to request.path+'/edit', notice: "Vous avez rencontré des problèmes dans le hacking"

  end
  def myparams
    params.require(:posts_surname).permit(:id)

  end
    # Use callbacks to share common setup or constraints between actions.
    def set_posts_surname
      if params[:id] && params[:id] != 'sign_in'
      @posts_surname = PostsSurname.find(params[:id])
      @postssurname = PostsSurname.find(params[:id])
      elsif myparams[:id]
      @posts_surname = PostsSurname.find(myparams[:id])
      @postssurname = PostsSurname.find(myparams[:id])
      end
          @moussaillons =Person.all

    end

    # Only allow a list of trusted parameters through.

    def posts_surname_params
params.fetch(:posts_surname, {}).permit(:action_name,:whoiam,:new_surname,:surname_id,:surnamedestinataire_id,:stranger_id,:recordingmylanguage, :recordingmyemotion,:content_fr, :content_de, :content_en, :fakename, :other_posts_surname,:destinataire_id,:realname, :avatar, :destinataire,:speaklike_id,:realname_id, :thing_id,:place_id,:sailor_ids,:person_id,:posts_surname_id,:other_posts_surname_id,:profilepic_id,:photoprofilactuelle, :_destroy,:sailor_id,:post_id,:thing_attributes=>{},:posts_surnames_attributes=>{},:surname_attributes=>{},:people_hacked_ids=>[],:recordmywords1=>[], :myownwords1=>[], :contentmyownwords1=>[], :recordmyphrasesandwords1=>[], :myownphrasesandwords1=>[], :contentmyownphrasesandwords1=>[],:recordmyphrasesandwords1=>[],:recordmywords1=>[],:myownphrasesandwords1=>[],:contentmyownphrasesandwords1=>[],:myownwords1=>[],:contentmyownwords1=>[],:recordmyphrasesandwords2=>[],:recordmywords2=>[],:myownphrasesandwords2=>[],:contentmyownphrasesandwords2=>[],:myownwords2=>[],:contentmyownwords2=>[],:other_posts_surname_ids=>[],:realname_attributes=>{},:destinataire_attributes=>{},:avatar_attributes=>{},:surnamedestinataire_attributes=>{},:place_attributes=>{})
    end
#    def ps_params
#params.require(:post_surname).permit(:stranger_id,:recordmyphrasesandwords=>[], :sailorhavingthistask=>[],:recordmywords=>[],:mytaskwiththerecording=>[],:myownphrasesandwords=>[], :contentmyownphrasesandwords=>[], :myownwords=>[],:contentmyownwords=>[], :recordmyphrasesandwords1=>[],:recordmywords1=>[],:myownphrasesandwords1=>[],:contentmyownphrasesandwords1=>[],:myownwords1=>[],:contentmyownwords1=>[],:recordmyphrasesandwords2=>[],:recordmywords2=>[],:myownphrasesandwords2=>[],:contentmyownphrasesandwords2=>[],:myownwords2=>[],:contentmyownwords2=>[],:addmyrelation_id=>[], :addmyrelation_text=>[],:addmybigrelation_id=>[],:addmymiddlerelation_id=>[])
#    end
end
