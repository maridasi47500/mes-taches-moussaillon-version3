require "assets/postsprimark"
class PostsController < ApplicationController
before_action :severalalias, only: [:index]
before_action :set_post, only: [:socialmovements,:myjingles,:addnewaddress,:tweets,:addnewavatars, :editavatars, :avatars,:newpostwithcollections, :myfrequentpeople, :myproposals,:photosorfilms,:myepochs, :mymoviescenes,:mycomicbooks,:myhistoricalcharacters, :reproduire, :addcompany, :addwebpage, :addmovie,:currentprofilepic, :facebookreq, :addcontent,:mylayoutpost, :linkreaction,:attitude,:tasksposts,:messagescaches,:words,:synonyms,:fakecomments,:metonymies,:anaphorsposts,:googlereq,:postsplaces,:addtvseries,:addnewjingles,:addtendances,:adddishes, :postexpired, :emailsforposts, :avatars, :postsjingles, :character, :newtendances, :newjingles, :searchposts, :collectionstasks, :addadish,:addaword, :show, :edit, :update, :destroy,:usurpation,:tasks,:facts,:thread,:surnames,:usurp,:allsailors,:mestachesdehacker,:addasongtothispost,:addamap,:addaposttype,:deletesurname]

#before_action :completecollections, only: [:myproposals, :photosorfilms,:myepochs,:mymoviescenes,:mycomicbooks,:myhistoricalcharacters, :reproduire,:addcompany, :addwebpage,:addmovie,:currentprofilepic,:facebookreq, :addcontent, :mylayoutpost, :linkreaction,:attitude,:tasksposts,:messagescaches,:words,:synonyms,:fakecomments,:metonymies,:anaphorsposts,:googlereq,:postsplaces,:addtvseries,:addnewjingles,:addtendances, :adddishes, :postexpired, :emailsforposts, :avatars, :postsjingles, :character, :newtendances, :newjingles, :searchposts, :collectionstasks, :addadish,:addaword, :postsnew, :new, :edit,:create,:update,:usurp]
before_action :pagination, only: [:mylayoutpost, :linkreaction,:index, :searchposts,:posts]
before_action :newpost, only: [:new, :newpostwithcollections]
layout false, only: [:socialmvmt,:i18nphrases,:thistasknotthistask,:hernother,:hackedpeople,:mysongs,:myposts,:emoticonid]

#after_action :renderedit, only: [:messagescaches,:words,:synonyms,:fakecomments,:metonymies,:anaphorsposts,:googlereq,:postsplaces,:addtvseries,:addnewjingles,:addtendances, :avatars, :postsjingles, :emailsforposts]
#before_action :set_collection, only: [:myproposals,:photosorfilms,:myepochs,:mymoviescenes,:mycomicbooks,:myhistoricalcharacters, :reproduire,:addcompany,:addwebpage,:addmovie,:currentprofilepic,:facebookreq, :addcontent, :mylayoutpost, :linkreaction,:attitude,:tasksposts,:messagescaches,:words,:synonyms, :fakecomments,:metonymies,:anaphorsposts,:googlereq,:postsplaces,:addtvseries,:addnewjingles, :addtendances, :adddishes, :postexpired, :emailsforposts, :avatars, :postsjingles, :character, :newtendances, :newjingles, :searchposts, :collectionstasks, :new,:show, :edit, :update, :destroy,:usurpation,:index]
before_action :authenticate_user!
def myreactiontrueanswer
@r=Reactiontrueimage.find(params[:reactiontrueimage_id])
@emoticon=Emoticon.find((Emoticon.all.ids.map {|x| [params["#{x}emoticon.x"],x]}.select{|x|x[0]}[0][1] rescue nil)) rescue nil
@person=Person.find(params[:person_id])
@reactionimage=Reactionimage.create(post: @r.post, posts_surname: @r.posts_surname, user: current_user, reactionpic: @emoticon, person: @person)
@r.test=@emoticon.id
@r.save


end
def deletesurname
@p=Postssurnamesforpost.find_by_posts_surname_id_and_post_id(params[:psid],params[:id])
@p.delete
redirect_to @post
end
def reactiontrueanswer
@r=Reactiontrueimage.find(params[:reactiontrueimage_id])
@person=Person.find(params[:person_id])

end
def rightorwrongposts
@r=Reactiontrueimage.all
       @person=Person.find((Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil)) rescue nil

end
def personsaysthat
       @emoticon=Emoticon.find((Emoticon.all.ids.map {|x| [params["#{x}emoticon.x"],x]}.select{|x|x[0]}[0][1] rescue nil)) rescue nil
@a=Reactiontrueimage.new(ilditca_params)
@a.reactionpic=@emoticon
@a.save
p @a.errors
@posts=Post.findbyid(ilditca_params[:post_id])
render :choosetrueid
end
def emoticonid
@emoticon=Emoticon.find(params[:id])
end
def choosetrueid
@posts=Post.findbyid(anypostcontent_params[:post_ids])
end
 def myposts
@posts=Post.findbyid(params[:id])
p @posts
 end
 def choosesailorpost1
end
def json
@posts=Post.findbyname(params[:name])
render json: @posts
end
def postrange
end
def postrangeposts
@posts=Post.where(['created_at <= ? and created_at >= ?',params[:end].to_date,params[:begin].to_date])
p @posts
@post=@posts.joins(:my_posts_surnames) rescue []

@post2=@posts.joins(:posts_surnames) rescue []
@people=Person.where(id: @post.pluck(:sailor_id,:speaklike_id,:person_id,:destinataire_id).to_a.flatten)
@people=Person.where(id: @post2.pluck(:sailor_id,:speaklike_id,:person_id,:destinataire_id).to_a.flatten)
end
def placeid
@place=Place.find(params[:id])
end
def addamap
end
def mysongs
@songs=Song.findbyid(params[:id])
end

def mestachesdehacker
end
def addasongtothispost
end
def hackedpeople
@people=Person.findbyid(params[:id])
end
def hernother
@hernothers=Hernother.findbyid(params[:id])
end
def thistasknotthistask
@thistasknotthistasks=Thistasknotthistask.findbyid(params[:id])

end
def i18nphrases
@i18nphrases=I18nphrase.findbyid(params[:id])
end
def socialmovements
end
def socialmvmt
@socialmovements = Socialmovement.findbyid(params[:id])
end
def jingles
@jingles=Jingle.findbyid(params[:id])
render layout: false
end
def myjingles
end
def allmytasks
      @tasks=Task.find_all_by_id(params[:id])
render layout: false
end

def addnewaddress
@post.addresses.new
end
def tweets

end
def addnewavatars
end
def editavatars

end
def myproposals
  if params[:post]
    begin
    @mypost=Post.new(post_params)
    rescue
    end
    @post.proposals = @mypost.proposals
    #@post.proposals << @mypost.proposals
    #@post.proposals = @post.proposals.distinct
  end
  if params[:proposal] == 'new'
      @post.proposals.new
  end
  render :monhacking, locals: {post: @post}
end
def yourlayoutpost
  @people=Person.where(id: params[:hackseveralpeople])
  @myphoto=@people.chosephotofromalbum
  @locale=Locale.new
  @cat=Category.new
  @otherlocales=[]
  #@art=Article.new(@post)
  @mylayout = Mylayout.find_by(typelayout: params[:layouttype])
  render "posts_layouts/#{@mylayout.typelayout}", layout: @mylayout.name
end
def newpostwithcollections
@collections=Collection.all
  @taskcollections=Taskcollection.all

  @post.recordings.new
end
def yourlayoutpeople
      render :monhacking, locals: {post: @post}
end
def photosorfilms
      render :monhacking, locals: {post: @post}
end
def myepochs
  @post.epochs.new if !@post.epochs[0]
      render :monhacking, locals: {post: @post}
end
def mymoviescenes
      render :monhacking, locals: {post: @post}
end
def mycomicbooks
      render :monhacking, locals: {post: @post}
end
def myhistoricalcharacters
  @post.historical_characters.new
      render :monhacking, locals: {post: @post}
end
def reproduire
  @newpost=@post.dup.save
  redirect_to @newpost


rescue
  redirect_to posts_path, notice: "there was an error in saving this post."
end
def mondestinataire
ps=('%'+params[:mondestinataire].gsub(' ','%')+'%').downcase
  @post = Post.new
  @post.my_posts_surnames.new(surname: Surname.new, profilepic: Profilepicture.new)
  
  @mesdestinataires=Person.where("name like ? or firstnames like ? or lastname like ? or description like ?",ps,ps,ps,ps)
  @myprofilepics=Profilepicture.where(id: Person.where(id: @mesdestinataires.pluck(:id)).joins(:permanentprofilepictures).pluck("profilepictures.id"))+Person.where(id: @mesdestinataires.pluck(:id)).allmyprofilepics
  render layout: false 
end
def myavatars

  @post=Post.new
@modelname=params[:modelname].to_s
@objectname=params[:objectname][0].to_s
@fieldname='['+params[:fieldname].to_s+']'
@myclassname=Object.const_get(@modelname)
p @myclassname
param= @myclassname == Profilepicture ? 'nameimage' : 'name'
@objects=@myclassname.where("lower(#{param}) like ?","%#{params[:profilepic].downcase}%")
p @objects
        render :myavatarssaved, locals: {post: @post}, layout: false

end
def myfrequentpeople
  @people = Person.where(id: PostsSurname.joins(:avatar).group("people.id").count.to_a.sort_by {|a,b| b}.map {|x| x[0]}.reverse.take(10))
  render :mypeople, layout: false
end
def mycollectionsofpeople
  @collections=Collection.all
  @taskcollections=Taskcollection.all
  render layout: false 

end
def mypeople
#pers=params[:myprofilepic]||params[:mapersonne]
ps=('%'+params[:cherchernom].gsub(' ','%')+'%').downcase
  @post = Post.new
  @post.my_posts_surnames.new(surname: Surname.new, profilepic: Profilepicture.new)
  
  @people=Person.where("name like ? or firstnames like ? or lastname like ? or description like ?",ps,ps,ps,ps)
  @myprofilepics=Profilepicture.where(id: Person.where(id: @people.pluck(:id)).joins(:permanentprofilepictures).pluck("profilepictures.id"))+Person.where(id: @people.pluck(:id)).allmyprofilepics

  render layout: false
rescue
  p @post.errors
  @people=Person.afficherceuxla(@addthosesailors,@post,pers)
  p @people
  @myprofilepics=Profilepicture.where(id: Person.where(id: @people.pluck(:id)).joins(:permanentprofilepictures).pluck("profilepictures.id"))+Person.where(id: @people.pluck(:id)).allmyprofilepics
  render layout: false
end
def myownpeople
pers=params[:myprofilepic]||params[:mapersonne]
  @post = Post.new
  @people=Person.afficherceuxla(@addthosesailors,@post,pers)
  @myprofilepics=Profilepicture.where(id: Person.where(id: @people.pluck(:id)).joins(:permanentprofilepictures).pluck("profilepictures.id"))+Person.where(id: @people.pluck(:id)).allmyprofilepics

  render layout: false
rescue
  p @post.errors
  @people=Person.afficherceuxla(@addthosesailors,@post,pers)
  p @people
  @myprofilepics=Profilepicture.where(id: Person.where(id: @people.pluck(:id)).joins(:permanentprofilepictures).pluck("profilepictures.id"))+Person.where(id: @people.pluck(:id)).allmyprofilepics
  render layout: false
end
def addcompany
  @post.companies.new
      render :monhacking, locals: {post: @post}
end
def addwebpage
  @post.webpages.new
      render :monhacking, locals: {post: @post}
end
def addmovie
  @post.movies.new
      render :monhacking, locals: {post: @post}
end
def currentprofilepic
  @post.posts_surnames.each {|x| x.updatephotoprofilactuelle }
  @post.my_posts_surnames.each {|x| x.updatephotoprofilactuelle }
  redirect_to @post
end
def facebookreq
  @content=@post.facebook_requests.new.googleresults.new
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end
def addcontent
  @content=@post.contents.new
  @content.photos.new
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end
def mylayoutfrontpage
  @mylayout = Mylayout.find_by(typelayout: params[:layouttype])
  @frontpage=Frontpage.find(params[:id])
  @people=@frontpage.people
  @myphotos=@people.map {|x|x.image}
  render "posts_layouts/#{@mylayout.typelayout}", layout: @mylayout.name, locals: {post: @post}
end
def mylayoutpost
  @locale=Locale.new
  @cat=Category.new
  @otherlocales=[]
  @art=Article.new(@post.as_json)
  @mylayout = Mylayout.find_by(typelayout: params[:layouttype])
  @people=@post.my_posts_surnames.mysurnames2
  @myphotos=@people.map {|x|x.image}
  render "posts_layouts/#{@mylayout.typelayout}", layout: @mylayout.name, locals: {post: @post}
end
def linkreaction
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end
def tasksposts
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}
end
def messagescaches
  @post.messagecaches.new
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end
def attitude
  @post.create_attitude
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end
def words
  @post.words.new
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end
def synonyms
  @post.synonyms.new
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end
def fakecomments
  @post.fakecomments.new
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end
def metonymies
  @post.metonymies.new
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end
def anaphorsposts
  @post.anaphors.new
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end
def googlereq
  @post.google_requests.new.googleresults.new
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end
def postsplaces
  @post.places.new
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end
def addtvseries
  @post.tvseries.new
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end
def addnewjingles
  @post.jingles.new
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end
def addtendances
  @post.tendances.new
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end
def adddishes
  @post.dishes.new
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end
def postexpired
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end
def emailsforposts
  @post.emails.new
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end
def postsjingles
  @post.jingles.new
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end
def avatars
  @post.my_posts_surnames.new(surname:Surname.new,person: Person.new,thing:Thing.new,surnamedestinataire: Surname.new) 
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :myavatars2, locals: {post: @post}


end
def character
  @post.posts_surnames.new(surname:Surname.new,person: Person.new,thing:Thing.new,surnamedestinataire: Surname.new) 

  render locals: {post: @post}

end

def newtendances
  if params[:id]
  @post=Post.find(params[:id])


  else
  @post=Post.new

  end
  
  @word=@post.tendances.new
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end
def newjingles
  if params[:id]
  @post=Post.find(params[:id])


  else
  @post=Post.new

  end
  @word=@post.jingles.new
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end

def repliquefilm
  @post=Post.find(params[:id])
end
def mesicones
  @post=Post.find(params[:id])
      render :monhacking, locals: {post: @post}

end
def collectionstasks
end
def searchposts
  @allposts=Post.where('lower(content_fr) like ? or lower(content_en) like ? or lower(content_de) like ?',r,r,r).firstpostofthethread.order(created_at: :asc).reverse.limit(10).offset(@nopage).to_a+Post.joins('left join posts_surnames on posts_surnames.post_id = posts.id').findthem(r).limit(10).offset(@nopage).to_a
  @allposts||=[]

  @posts=@allposts.to_a.each_slice(3).to_a


  render :index

end
def addaword
  if params[:id]
  @post=Post.find(params[:id])


  else
  @post=Post.new

  end
  @word=@post.words.new
  @word.meanings.new
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end
def addadish
  if params[:id]
  @post=Post.find(params[:id])


  else
  @post=Post.new

  end
  @dish =@post.dishes.new
      #render (params[:id] ? :edit : :new), locals: {post: @post}
      render :monhacking, locals: {post: @post}

end

def persondisplay
  @person=Person.find(params[:id])
  render inline: "<%=render @person%>"
end
def thingdisplay
  @thing=Thing.find(params[:id])
  render inline: "<%=render @thing%>"
end
def eventdisplay
  @event=Event.find(params[:id])
  render inline: "<%=render @event%>"
end
def postsnew
  @post = Post.new(post_params)
  new = params[:new]
  @new=editpostparams[:addstuff]
      @colonnes = {11=>"add people",12=>"as if you sent an email",2=>"search people",3=>"selected people",10=>"add places",4=>"tasks",6=>"Hacking the sailors",5=>"add video / audio / photo",7=>"Add a metonymy",1=>"synonyms",9=>"anaphors",8=>"what you would do"}

    if @new.include? "reactions"
    @post.reactions.new
    end
    if @new.include? "events"
    @post.events.new
    end
    if @new.include? "googlereq"
    @post.google_requests.new
    end
    if @new.include? "metonymies"
      @post.metonymies.new(name: '', thing: Thing.new)
    end
    if @new.include? "synonyms"
      @post.synonyms.new(content: '')
    end
    if @new.include? "attitudes"
      @post.build_attitude(name: '', thing: Thing.new).build_attitude(name: '', thing: Thing.new)
    end
    if @new.include? "posts_surnames"

      if @post.posts_surnames.count == 0
        @post.posts_surnames.new(surname:Surname.new,person:nil,thing:Thing.new,surnamedestinataire: Surname.new) 

      end
    end
    if @new.include? "profilepic"
p @post
p @post.profilepicspossible
p @post.profilepicschosen
p @post.myprofilepicspossible
p @post.profilepicspossiblebis, "bis"
p @post.myprofilepicschosen
p @post.posts_surnames
    end
    if @new.include? "anaphors"

      @anaphor = @post.anaphors.new
    end
    if @new.include? "nicephotos"

      @post.nicephotos.new
    end
    if @new.include? "actions"
    @post.actions.new
    end
    if @new.include? "sailors"
    @post.sailors.new

    end

    respond_to do |format|
      format.js {render locals: {post: @post}}
    end
  end
  def allsailors
    @sailors=@post.moussaillonsdecepost
  end
  
  def tasks
  end
  def addametonymy
    respond_to do |format|
      format.js
    end
	
  end
  def addasynonym
    respond_to do |format|
      format.js
    end
	
  end
  def renderareaction
    @reaction=Reaction.find(params[:id])
    respond_to do |format|
      format.js {render :renderareaction}
    end
  end
  def renderareactionwithoutid
    paramsreactions = reactions_params[:reactions_attributes].values.last
    @reaction = Reaction.new(paramsreactions.except(:_destroy))
    respond_to do |format|
      format.js {render :renderareaction}
    end
  end
  def deleteallthoseposts
    allpostsids=params[:thispostids]
    Post.where(id: allpostsids).destroy_all
    redirect_to '/'
  end
  def thread
    @post.main_threads.new
  end
  def usurp
    postsurname=params[:idsurname]
    @postsurname =PostsSurname.find(postsurname)
    @moussaillons = params[:personids] ? Person.find(id: params[:personids].split(',')) : []
    moussaillon =@postsurname.sailor
  end
  def talkaboutthis
    @thing = Thing.find(params[:id])
    respond_to do |format|
      format.js {render :talkaboutthis}
    end
  end

  def renderallthethings
    @task = Task.find(params[:id])
    @things = @task.things.where.not(name: "")
    respond_to do |format|
      format.js {render :renderallthethings}
    end
  end
  def renderapostinrealtime
    @post = Post.new(post_params)
    @post.id=1
    render partial: "posts/post", locals: {post: @post}
  end
  def surnames
    @moussaillons=@post.moussaillonsdecepost
#    @moussaillons.each do |moussaillon|
#    @post.posts_surnames.new(sailor: moussaillon,post: @post,surname:Surname.new,place: Place.new,person:moussaillon) 
#    #@allmoussaillons << @post.posts(moussaillon)
#    end
    if @post.posts_surnames.count == 0
    @post.posts_surnames.new(post: @post,surname:Surname.new,person:nil) 
    end
    @post.posts_surnames.each do |newpostsurname|
            nbsailors=newpostsurname.post.moussaillonsdecepost.count
      nbpeople=newpostsurname.people.count
      diff=(nbsailors-nbpeople).abs
      if nbsailors > nbpeople
        p "nbsailor>nbpeople"
        diff.times {|x|newpostsurname.people.new}
      elsif nbsailors < nbpeople
        p "nbsailor<nbpeople"
        newpostsurname.people.last(diff).each{|x|x.destroy}

      end

      end



  end

  def facts
  end
  def editall
      @posts = Post.all.where(post_id: nil)
  end
  def renderapost
    @post = Post.find(params[:id])
    render partial: "posts/cite", locals: {post: @post}
  end
  def renderaperson
    @person = Person.find(params[:id])
    render partial: "application/people", locals: {person: @person}
  end
  def renderatask
    @task = Task.find(params[:id])
    render partial: "posts/renderatask", locals: {task: @task}
  end

  def searchpost
    search=params[:post]
    sql='%'
    array=Post.where('content like ?',sql+search.split(' ').join(sql)+sql).select('id as value, content as label').as_json.map {|o| o.except!('id') }
    render json: (search.length > 2 ? array : [])
  end
  
  def index
    @allposts=Post.firstpostofthethread.annotate("offset et limit accélère le chargement de la page!!").where('created_at > ?',DateTime.now.beginning_of_day).order(created_at: :desc).limit(10).offset(params[:page].to_i * 10).to_a
    @posts=@allposts || []
    respond_to do |format|
        format.html
        format.js {render :edit}
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    respond_to do |format|
        format.html {render locals: {post: @post}}
        format.js {render :edit}
    end
  end

  # GET /comments/new
  def new
if params[:ajax]
render layout: false
end


    respond_to do |format|
        format.html
        format.js {render :edit}
    end

  end

  # GET /comments/1/edit
  def edit

      


    if params["addsupplementaryavatar"]=="1"
        @post.my_posts_surnames.new(surname:Surname.new,person: Person.new,thing:Thing.new,profilepic: Profilepicture.new, realname: Surname.new, destinataire: Person.new, avatar: Person.new,surnamedestinataire: Surname.new) 
    end


    respond_to do |format|
        format.html
        format.js {render :edit}
    end
  end
  def renderanemail
    @email = Email.new(email_params[:emails_attributes].values.last)
    respond_to do |format|

      format.js {render :renderanemail}
    end

  end
  def renderoneemail
    @email = Email.find(params[:id])
    respond_to do |format|

      format.js {render :renderanemail}
    end

  end

  # POST /comments
  # POST /comments.json
  def create
    @post = Post.new(post_params.merge({authors: [current_user], auteurrecording: current_user.id}))

    validated = @post.name == current_user.name
    @comment=@post
    while @comment.article != nil do
        @comment = @comment.article
    end
    respond_to do |format|
      if params[:returnid] && @post.save
        format.json { render json: @post}

      elsif @post.save
        format.html { redirect_to @comment, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        p @post.errors
        p @post.errors.count
        p @post
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  rescue ActionController::UnknownFormat
    p pathfile
    p filename
  end
  def submitmypost
    @post = Post.new(post_params.merge({authors: [current_user], auteurrecording: current_user.id}))

    validated = @post.name == current_user.name
    @comment=@post
    while @comment.article != nil do
        @comment = @comment.article
    end
    respond_to do |format|
      if @post.save
        format.html { render inline:  "<%=render @comment%>"}
      else
        format.html { render inline:  "<%=render partial: 'posts/posterrors',collection: [@comment], as: :post%>"}
      end
    end
  rescue ActionController::UnknownFormat
    p pathfile
    p filename
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    if valider && valider.to_i > 0 && !@post.post_id
      @post.validators << current_user
    end
    @post.update_attribute('commentedperson_ids', post_params[:commentedperson_ids])
    respond_to do |format|
      if params[:id] == 'new'
        @post=Post.new
        @post.assign_attributes(post_params)
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }

      elsif valider || @post.update(post_params)
        if @post.usualactions.count > 0
          notdone = Routine.where(id: @post.usualaction_ids)[0].relatedtasks.where(done:false).select('events.name as taskname,events.id as id') 
          if notdone.length > 0
                    content=""
          content << "chaque jour du matin au soir je ne suis pas d'accord avec toi tant que tu n'as pas "
          content << notdone.map {|x| 'TACHE('+x.id.to_s+')'}.join(' ')
          @post.update(content_fr: @post.content_fr.to_s+content)
          end
        end
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
        
      elsif !valider
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        p @post.errors
      end
    end
    rescue ActiveRecord::RecordNotFound => e


      @post.anaphors.joins(:nicephotos).where(photos:[]).destroy_all

    respond_to do |format|
      if params[:id] == 'new'
        @post.my_posts_surnames.new(surname: Surname.new, profilepic: Profilepicture.new)
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      elsif valider || @post.update(post_params)

        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
        
      elsif !valider
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        p @post.errors
      end
    end
  end
  def createnewthread
    @post = Post.new
    @post.threads.new
    render layout: false
  end
  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    p "detruire ce post"
    @post.destroy
    
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def valider
    params[:valider]
  end

  def set_collection
    @pid=params[:pid] ? Person.where(id:params[:pid]).first : nil
    @hackingtype = params[:hackingtype] || nil
    @cod = params[:code]
  end
    
  def completecollections
    @colonnes = {11=>"add people",12=>"as if you sent an email",8=>"Meaning words",2=>"search people",3=>"selected people",10=>"add places",4=>"tasks",6=>"Hacking the sailors",5=>"add video / audio / photo",7=>"Add a metonymy",1=>"synonyms",9=>"anaphors",8=>"what you would do"}
    params[:tasks]||=params[:post]?params[:post][:actions]:nil
    collectionid=params[:collection]
    @collection = collectionid.to_i > 0 ? Collection.find(collectionid).people : []
    year=params[:year].to_i > 0 ? params[:year] : nil
    month=params[:month].to_i > 0 ? params[:month] : nil
    @taskselected=params[:tasks].to_i>0 ? Task.find(params[:tasks]) : nil
    personids = params[:personids] ? params[:personids][0].split(',') : []
        @peoplesearched||=[]

    @peoplesearched =params[:personids] ? Person.where(id: personids) : []
    @addaplacetopost =params[:addaplace]
    @addaplacetosurnameattribute = params[:addaplacetosurnameattribute]
    @peoplesearched += @collection
    pplhack = params[:peopletohack]
    if pplhack
    @peoplesearched += Person.where(id: pplhack.split(','))
    end
    begin
    @peoplesearched += current_user.aliases
    rescue
    end
    if params[:hackseveralpeople]
      @peoplesearched+= Person.where(id: params[:hackseveralpeople])
    end
    if params[:id]
@peoplesearched ||= []
if params[:id] && params[:id] != 'new'
@mypost=Post.find(params[:id])

@peoplesearched += @mypost.people_hacked
end

    end
    personids=Person.where(id:10)
    @tasksofsailors = Task.joins(:sailors).where('people.id' => personids)
    @usualtasksofsailors= Routine.joins(:sailors).where('people.id' => personids)
    @stuff = Thing.all.joins(:tasks).where(tasks:Task.where(id:[params[:tasks]]))
    #@postssurnamedisplay = PostsSurname.joins(:sailor).where(person: @peoplesearched)+PostsSurname.where(person: @peoplesearched)
    @postssurnamedisplay = []
    @moussaillons = []
@addthosesailors = params[:addthosesailors] ? Person.where(id: params[:addthosesailors]) : nil
@addthosesailors ||= []
@addthosesailors += @peoplesearched
if @mypost
@addthosesailors += @mypost.posts_surnames.map {|x| x.avatar}
@addthosesailors += @mypost.posts_surnames.map {|x| x.destinataire}
@addthosesailors += @mypost.my_posts_surnames.map {|x| x.avatar}
@addthosesailors += @mypost.my_posts_surnames.map {|x| x.destinataire}
end

@addthosesailorstasks = @addthosesailors && @addthosesailors[0] ? @addthosesailors[0].todojobs : nil
  end
    def pagination
              page=params[:page] || 0
        @nopage  = page.to_i
    margin=10
    @minpage= (5-@nopage) <= 5 && (5-@nopage) >= 0 ? 0 : (@nopage - 5)

    @pagination=(@minpage..(@nopage+margin)).to_a

    end
  def set_post
    p @post
    @changeuserid = changeuserid
    @recipients = session[:recipients]
    p @recipients
    @displayrecipients = displayrecipients
    p @displayrecipients 
    if params[:id] && params[:id] != "new"
      @post=Post.find(params[:id])


    else
    @post=Post.new

    end


  end
  def email_params
    params.require(:post).permit(:emails_attributes=>{})
  end
  def reactions_params
    params.require(:post).permit(:reactions_attributes=>{})
  end
  def editpostparams
    params.require(:mypost).permit(:addstuff=>[])
  end
  def renderedit
    render (params[:id] ? :edit : :new), locals: {post: @post}

  end
  def newpost
        @changeuserid = changeuserid
    @recipients = recipients
    @displayrecipients = displayrecipients
    @post ||= Post.new(post_id: params[:postidanswer], main_threads: [MainThread.new(validated: false)])
    @cod = params[:code]
        @moussaillons ||=[]
@searchedpeople ||=[]
    @moussaillons+=@post.moussaillonsdecepost
        @moussaillons+= @searchedpeople
        @post.my_posts_surnames.new(surname:Surname.new,person: Person.new,thing:Thing.new,profilepic: Profilepicture.new, realname: Surname.new, destinataire: Person.new, avatar: Person.new,surnamedestinataire: Surname.new) 
    if params["addsupplementaryavatar"]=="1"
        @post.my_posts_surnames.new(surname:Surname.new,person: Person.new,thing:Thing.new,profilepic: Profilepicture.new, realname: Surname.new, destinataire: Person.new, avatar: Person.new,surnamedestinataire: Surname.new) 
    end
    album=params[:albumid]
        if album
          @post.photos << Album.find(album).photos
        end
        @jingles = Jingle.where(id: params[:jingleid]) rescue []

  end
  # Only allow a list of trusted parameters through.
def severalalias
if user_signed_in? && current_user.aliases.length == 0
redirect_to edit_user_registration_path
end
end
  def ilditca_params
    params.require(:ilditca).permit(:user_id, :posts_surname_id, :post_id)
  end
  def anypostcontent_params
    params.require(:anyname).permit(:post_ids=>[])
  end
  def post_params
    params.require(:post).permit(:addamap,:hei,:wid,:id,:my_posts_surname_ids ,:posts_surname_ids,:messagecache, :title,:active_usurpations,:name, :content,:content_de,:post_id, :inverse_hacking,:content_fr, :content_en,:person_id,:reactions_attributes,:commentapost,:otherposts,:companies_attributes=>{},:google_requests_attributes=>{},:onetimes_attributes=>{},:tendances_attributes=>{},:main_threads_attributes=>{},:attitude_attributes=>{},:contents_attributes=>{},:synonyms_attributes=>{},:metonymies_attributes=>{},:postlikecomments_attributes=>{},:proposals_attributes=>{},:surnamedestinataire_attributes=>{},:movies_attributes=>{},:jingles_attributes=>{},:personaljingles_attributes=>{},:emails_attributes=>{},:jingles_attributes=>{},:anaphors_attributes=>{},:places_attributes=>{},:dishes_attributes=>{},:fakecomments_attributes=>{},:facebook_requests_attributes=>{},:webpages_attributes=>{},:messagecaches_attributes=>{},:events_attributes=>{},:photos_attributes=>{},:threads_attributes=>{},:main_threads=>{},:posts_surnames_attributes=>{},:reactions_attributes=>{},:epochs_attributes=>{},:posttypes=>[],:words_attributes=>{},:my_posts_surnames_attributes=>{},:reaction_ids=>[],:my_posts_surname_ids=>[],:commentedperson_ids=>[],:thing_ids=>[],:surname_ids=>[],:usualaction_ids=>[],:personnessimilaire_ids=>[],:avissimilaire_ids=>[],:destinataire_ids=>[],:recordings=>[],:videos=>[],:photos=>[],:aboutsomeonegossip_ids=>[],:usurpation_ids=>[],:postsaproposdelle_ids=>[],:hackedperson_ids=>[],:post_type_ids=>[],:tweet_ids=>[],:dish_ids=>[],:commeelle_ids=>[],:action_ids=>[],:onetime_ids=>[], :technique_ids=>[],:argument_ids=>[],:posts_surname_ids=>[],:jingle_ids=>[],:tvseries_ids=>[],:photo_ids=>[],:historical_character_ids=>[],:i18nphrase_ids=>[],:comicbook_ids=>[],:moviescene_ids=>[],:epoch_ids=>[],:mylayout_ids=>[],:supporttask_ids=>[],:recordmywords1=>[], :myownwords1=>[], :contentmyownwords1=>[], :recordmyphrasesandwords1=>[], :myownphrasesandwords1=>[], :contentmyownphrasesandwords1=>[],:recordmyphrasesandwords1=>[],:recordmywords1=>[],:myownphrasesandwords1=>[],:contentmyownphrasesandwords1=>[],:myownwords1=>[],:contentmyownwords1=>[],:recordmyphrasesandwords2=>[],:recordmywords2=>[],:myownphrasesandwords2=>[],:contentmyownphrasesandwords2=>[],:myownwords2=>[],:thistasknotthistask_ids=>[],:hernother_ids=>[],:contentmyownwords2=>[],:robot_ids=>[],:song_ids=>[],:socialmovement_ids=>[],:displaygossip_attributes=>{},:addresses_attributes=>{})

  end
end
