class TasksController < ApplicationController

  before_action :set_task, only: [:addtypetask,:addmytypetask,:grouptasksailoraddaction,:grouptaskseesailor,:addsenders, :addrecipients,:nouvelaidememoire, :successticket,:iaccomplishedthistask, :confirmdelete, :deletetask,:gossips,:messageforyou, :show, :edit, :update, :destroy,:showplaces,:nearbyplaces,:actiontasks,:noterealizedtask,:note,:attitudestask,:badidea,:goodidea,:risk,:saved,:drinks,:starattitude,:getwinning,:newgrouptask,:editgrouptask,:grouptask,:grouptaskaddsailors,:grouptasksailors,:notesailorstasks]
  before_action :set_people, only:[:addsenders, :addrecipients]
  before_action :load_collection, only: [:new, :edit,:index,:show]
protect_from_forgery except: [:attitudesailors, :actiontasks]
layout false, only: [:city,:attitudesailors,:myactions, :githubrepos,:things,:gossips,:epochs,:drinks,:tickets,:failingtickets,:taskactionidd,:recordings,:places,:googlerequest,:mytask,:getwinning,:tvseries,:films,:taskaccomplishment,:sailoraccomplishment,:accomplishsailors,:followingtasks,:songs]
def addmytypetask
@t=Tasktype.all.select {|g|params[:"#{g.id}thing.x"]}[0].id
@task.tasktypes << Tasktype.find(@t)
redirect_to edit_task_path(@task.id)
end
def songs
@songs=Song.findbyid(params[:id])
end
def myjobsailorbis
@s=Sailorjob.find(params[:id])
@s2=Sailorjobhavealias.find_or_create_by(user:current_user, sailorjob: @s)
@sj1=Sailorjob.find(params[:firstsailorjobid])
@s1=Sailorjobhavealias.find_or_create_by(user:current_user, sailorjob:@sj1)
Sailorjobhavealiasesdialog.find_or_create_by(sailorjobhavealias:@s1,othersailorjobhavealias: @s2)
end
def myjobsailor
@s=Sailorjob.find(params[:id])
Sailorjobhavealias.find_or_create_by(user:current_user, sailorjob: @s)
end
 def followingtasks
@tasks=Task.findbyid(params[:id])
    
  end
 def taskaccomplishment
@tasks=Task.findbyid(params[:id])
    
  end
 def sailoraccomplishment
@task=Task.find(params[:id])
@people=@task.sailors
render json: @people
    
  end
 def accomplishsailors
@people=Person.findbyid(params[:id])
    
  end
 def films
@films=Film.findbyid(params[:id])
  end
 def tvseries
@tvseries=Tvseries.findbyid(params[:id])
  end
 def getwinning
@winningattitudes=Winningattitude.findbyid(params[:thingid])
  end
 def starattitude
@k=@task.starattitudes.new(user: current_user)

 end
 def conditionnotneglectedtasks5
       @otherperson=Person.find((Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil)) rescue nil
     @othertask=Task.find(params[:myothertaskid])
     @person=Person.find(params[:mypersonid])
     @task=Task.find(params[:mytaskid])
@sj1=Sailorjob.find_or_create_by(sailor: @person, task:@task)
@sj2=Sailorjob.find_or_create_by(sailor: @otherperson, task:@othertask)
Conditionnotneglectedtask.find_or_create_by(welldonesailorjob: @sj1,neglectedsailorjob: @sj2)
   end
 def conditionnotneglectedtasks4
       @othertask=Task.find((Task.all.ids.map {|x| [params["#{x}task.x"],x]}.select{|x|x[0]}[0][1] rescue nil)) rescue nil
     @person=Person.find(params[:mypersonid])
     @task=Task.find(params[:mytaskid])
   end
 def conditionnotneglectedtasks3
       @person=Person.find((Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil)) rescue nil
     @task=Task.find(params[:mytaskid])
   end
 def conditionnotneglectedtasks2
       @task=Task.find((Task.all.ids.map {|x| [params["#{x}task.x"],x]}.select{|x|x[0]}[0][1] rescue nil)) rescue nil
   end
 def conditionnotneglectedtasks
   end
 def conditionwelldonetasks
   end
   def conditionwelldonetasks3
     @task=Task.find(params[:mytaskid])
            @othertask=Task.find((Task.all.ids.map {|x| [params["#{x}task.x"],x]}.select{|x|x[0]}[0][1] rescue nil)) rescue nil

   end
   def conditionwelldonetasks2
       @task=Task.find((Task.all.ids.map {|x| [params["#{x}task.x"],x]}.select{|x|x[0]}[0][1] rescue nil)) rescue nil

   end
  def thingid
    @thing=Thing.find(params[:id])
  end
  def newgrouptask
   @task.grouptasks.new
 end
 def editgrouptask
 end
 def grouptasksailoraddaction
   @grouptask=Grouptask.find(params[:grouptask_id])
   @person=Person.find(params[:person_id])
  @action=Taskaction.find((Taskaction.all.ids.map {|x| [params["#{x}taskaction.x"],x]}.select{|x|x[0]}[0][1] rescue nil)) rescue nil
@sailorgrouptask = Sailorgrouptask.find_or_create_by(person: @person, grouptask: @grouptask)
if @action
  @sailorgrouptask.taskactions << [@action]
end
     redirect_to grouptaskseesailor_task_path(@task.id, grouptask_id: @grouptask.id, person_id: @person.id)

 rescue
     redirect_to grouptaskseesailor_task_path(@task.id, grouptask_id: @grouptask.id, person_id: @person.id)
 
 end
 def grouptasksailoraddsailor
   @grouptask=Grouptask.find(params[:grouptask_id])
   @person=Person.find(params[:person_id])
  @sailor=Person.find((Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil)) rescue nil
 end
 def grouptasksailoraddthing
   @grouptask=Grouptask.find(params[:grouptask_id])
   @person=Person.find(params[:person_id])
  @thing=Thing.find((Thing.all.ids.map {|x| [params["#{x}thing.x"],x]}.select{|x|x[0]}[0][1] rescue nil)) rescue nil
@sailorgrouptask = Sailorgrouptask.find_or_create_by(person: @person, grouptask: @grouptask)

if @thing
  @sailorgrouptask.things << [@thing]
end
     redirect_to grouptaskseesailor_task_path(@task.id, grouptask_id: @grouptask.id, person_id: @person.id)

 rescue
     redirect_to grouptaskseesailor_task_path(@task.id, grouptask_id: @grouptask.id, person_id: @person.id)

   end
   def grouptaskseesailor
    
   @grouptask=Grouptask.find(params[:grouptask_id])
   @person=Person.find(params[:person_id])
@grouptasksailor= Sailorgrouptask.find_or_create_by(grouptask:@grouptask, person: @person)

   end

 def grouptasksailors
   @grouptask=Grouptask.find(params[:grouptask_id])
  @person=Person.find((Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil)) rescue nil
  if @person
@grouptask.people << [@person]
  end
  redirect_to grouptaskaddsailors_task_path(@task.id, grouptask_id: @grouptask.id)
rescue ActiveRecord::RecordInvalid
  redirect_to grouptaskaddsailors_task_path(@task.id, grouptask_id: @grouptask.id)
 end

 def grouptaskaddsailors
   @grouptask=Grouptask.find(params[:grouptask_id])

 end
 def grouptask
   @grouptask=Grouptask.find(params[:grouptask_id])
 end
  def recordings
@recordings=Recording.findbyid(params[:id])
  end
  def places
@places=Place.findbyid(params[:id])
  end
  def googlerequest
@googlerequests=GoogleRequest.findbyid(params[:id])
  end
  def justeca
    @tasks=Task.all
  end
  def searchtaskticket

  end
  def city
    @cities=City.findbyid(params[:id])
  end
  def taskhavetaskactiontwosailorjobprevious
                @othertaskint=Taskhavetaskactiontwosailorjob.all.ids.map {|x| [params["#{x}task.x"],x]}.select{|x|x[0]}[0][1] rescue nil

@task=Taskhavetaskactiontwosailorjob.find(params[:taskhavetaskactiontwosailorjob_id])
@othertask=Taskhavetaskactiontwosailorjob.find(@othertaskint)
begin
@previous=Myothertaskhavetaskactiontwosailorjob.create(taskhavetaskactiontwosailorjob: @task,othertask: @othertask)
rescue => e
p e
p @previous
    end

  end
  def taskhavetaskactiontwosailorjob
@task=Taskhavetaskactiontwosailorjob.find(params[:taskhavetaskactiontwosailorjob_id])

  end
  
  def taskactionsailorjobaddsailor
    @taskaction = Taskaction.find(params[:taskaction_id])
    @sailorjob = Sailorjob.find(params[:sailorjob_id])
            @intsailor=Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil
            @person=Person.find(@intsailor)
@o=@taskactionsailorjob=Taskactionsailorjob.find(params[:taskactionsailorjob_id])
@p=Taskhavetaskactiontwosailorjob.find_or_create_by(taskactionsailorjob: @o, person: @person)
render :taskactionsailorjob
  
end

  
  def taskactionsailorjob
    @taskaction = Taskaction.find(params[:taskaction_id])
    @sailorjob = Sailorjob.find(params[:sailorjob_id])
@o=@taskactionsailorjob=Taskactionsailorjob.create(taskaction: @taskaction, sailorjob: @sailorjob)

  
end
  
  def selectsailortaskaction
      @int=Person.all.ids.map {|x| [params["#{x}task.x"],x]}.select{|x|x[0]}[0][1] rescue nil
      @task=Task.find(@int)

end
def taskactionidd
  @taskaction = Taskaction.find(params[:id])
end
def selecttaskactionsailorjob
       @int=Taskaction.all.ids.map {|x| [params["#{x}taskaction.x"],x]}.select{|x|x[0]}[0][1] rescue nil
            @intsailor=Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil
if @intsailor
        @task=Task.find(params[:taskid])
@person=Person.find(@intsailor)
       @sailorjob=Sailorjob.find_or_create_by(sailor: @person, task: @task)

elsif @int
      @taskaction=Taskaction.find(@int)
      @task=Task.find(params[:taskid])
      @person=Person.find(params[:personid])
       @sailorjob=Sailorjob.find_by(sailor: @person, task: @task)
@taskactionsailorjob=Taskactionsailorjob.create(sailorjob: @sailorjob, taskaction: @taskaction)
end

end
def addtaskactiontosailorfortask
end
def twosailors
    @int=Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil
      @person=Person.find(params[:personid])
      @otherperson=Person.find(@int)
      @task=Task.find(params[:taskid])
      @othertask=Task.find(params[:othertaskid])
      @s1=Sailorjob.find_or_create_by(task: @task, sailor: @person)
      @s2=Sailorjob.find_or_create_by(task: @othertask, sailor: @otherperson)
@twosailor=Twosailorjob.find_or_create_by(sailorjob: @s1, othersailorjob: @s2)

end
def secondsailor
    @int=Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil
      @person=Person.find(@int)
      @task=Task.find(params[:taskid])
      @othertask=Task.find(params[:othertaskid])

end
def firstsailor
    @int=Task.all.ids.map {|x| [params["#{x}task.x"],x]}.select{|x|x[0]}[0][1] rescue nil
      @task=Task.find(params[:taskid])
      @othertask=Task.find(@int)

end
def secondtask
    @int=Task.all.ids.map {|x| [params["#{x}task.x"],x]}.select{|x|x[0]}[0][1] rescue nil


      @task=Task.find(@int)

end
def comparesailors




end
def sailorsofthistask
    @int1=Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil
    @int=Task.all.ids.map {|x| [params["#{x}task.x"],x]}.select{|x|x[0]}[0][1] rescue nil
    if @int
      @task=Task.find(@int)
    elsif @int1
      @task=Task.find(params[:taskid])
      @person=Person.find(@int1)
      Sailorjob.find_or_create_by(task:@task,sailor:@person)
    end
end
def deleteasailorimage
@q=Sailorjob.find(params[:id])
@q.destroy
redirect_to sailorsofthistask_tasks_path(taskid: @q.task.id)
end
def deleteasailor
@q=Sailorjob.find(params[:id])
@q.destroy
redirect_to @q.task
end
def failingtickets
@tickets=Ticket.findbyid(params[:id])
end
def tickets
@tickets=Ticket.findbyid(params[:id])
end
def drinks
@drink=Drink.find(params[:id])
end
def epochs
@epochs=Epoch.findbyid(params[:id])
end
def gossips
@gossips=Aboutsomeonegossip.findbyid(params[:id])
end
def things
@thing=Thing.find(params[:id])
end

def githubrepos
@githubrepos = Githubrepo.findbyid(params[:id])
end
def noterealizedtask
end
def note
end
def attitudestask
end
def badidea
end
def goodidea
end
def risk
end
def saved
end
def json
@task=Task.findbyname(params[:name])
render json: @task
end
def attitudesailors
@task=Task.find(params[:taskid])
end
def myactions
@actions=Taskaction.findbyid(params[:id])

end
def actiontasks

if params['worktask1.x'] || params['worktask2.x'] || params['worktask3.x']|| params['worktask4.x']|| params['worktask5.x']
int=(1..5).map {|x| [params["worktask#{x}.x"],x]}.select{|x|x[0]}[0][1]
@task.taskmucheffortsailors.create(person_id: params[:person_id],taskaction_id:params['taskaction_id'], user_id: current_user.id, task_id: @task.id,intensity: int)
redirect_to @task, notice: "T'es moussaillon!"
elsif params['attitude1.x'] || params['attitude2.x'] || params['attitude3.x']|| params['attitude4.x']|| params['attitude5.x']
#@task=Task.find(params[:taskid])
int=(1..5).map {|x| [params["attitude#{x}.x"],x]}.select{|x|x[0]}[0][1]
@task.sailorhaveattitudesintasks.create(score: int,attitude_id:params[:attitudeid], person_id: params[:personid], user: current_user, task: @task)
redirect_to @task, notice: "Super !"

elsif params['aime.x']
@task.aimetaches << [current_user]
redirect_to @task, notice: "Vous aimez cette tache"
elsif params['com.x']
Commenttask.create(user: current_user, task: @task, content: params[:comment])
redirect_to @task, notice: "Vous avez commenté"

elsif params['aimepas.x']
@task.aimepastaches << [current_user]
redirect_to @task, notice: "Vous n'aimez pas cette tache"
elsif params['1.x']
Notetask.create(task: @task, user: current_user, note: 1)
redirect_to @task, notice: "La tache est une bonne idee ?"
elsif params['2.x']
Notetask.create(task: @task, user: current_user, note: 2)
redirect_to @task, notice: "La tache est une bonne idee ?"
elsif params['3.x']
Notetask.create(task: @task, user: current_user, note: 3)
redirect_to @task, notice: "La tache est une bonne idee ?"
elsif params['4.x']
Notetask.create(task: @task, user: current_user, note: 4)
redirect_to @task, notice: "La tache est une bonne idee ?"
elsif params['5.x']
Notetask.create(task: @task, user: current_user, note: 5)
redirect_to @task, notice: "La tache est une bonne idee ?"
elsif params['dt1.x']
Noterealizedtask.create(task: @task, user: current_user, note: 1)
redirect_to @task, notice: "La tache est bien faite ?"
elsif params['dt2.x']
Noterealizedtask.create(task: @task, user: current_user, note: 2)
redirect_to @task, notice: "La tache est bien faite ?"
elsif params['dt3.x']
Noterealizedtask.create(task: @task, user: current_user, note: 3)
redirect_to @task, notice: "La tache est bien faite ?"
elsif params['dt4.x']
Noterealizedtask.create(task: @task, user: current_user, note: 4)
redirect_to @task, notice: "La tache est bien faite ?"
elsif params['dt5.x']
Noterealizedtask.create(task: @task, user: current_user, note: 5)
redirect_to @task, notice: "La tache est bien faite ?"
elsif params['risk.x']
Risktask.create(task: @task, person_id: params[:personid], user: current_user)
redirect_to @task, notice: "Le moussaillon prend les risques"
elsif params['riskforit.x']
Savedtasksailor.create(task: @task, person_id: params[:personid], user: current_user)
redirect_to @task, notice: "Le moussailon est sauvé."
elsif params['didthetask.x']
@c=Completetask.create(task: @task, person_id: params[:personid], otherperson_id: params[:otherpersonid],emotion_id:params[:emotid], user: current_user)
p @c.errors
redirect_to @task, notice: "Le moussailon a terminé sa tâche."

  end
rescue ActiveRecord::RecordInvalid
redirect_to @task

end
def worktwo
@worktwos = Worktwo.findbyid(params[:id])
render layout: false
end
def attitudes

      @attitudes=Attitude.findbyid(params[:id])
render layout: false
end
def myrelatedtasks

      @tasks=Task.mytasksfavourite(params[:id])
render :myrelatedtasks, layout: false
end

def allmytasks
      id=params[:name]
      @tasks=Task.find_by_name(params[:name])
render json: @tasks
end
def people
      id=params[:id]
      @people=Person.where(id: id)
render layout: false
end

  def addsenders
    render layout: false
  end
  def addrecipients
    render layout: false
  end
  def nouvelaidememoire
    p @task
    p @task.errors
    begin
    @task.update(task_params) 
    rescue => e
      p e.message
    p @task.errors
    
    @task=Task.new
    end
    render layout: false, locals: {task: @task}
  end
  def failureticket
    @ticket = @task.newfailureticket
    @people=@task.successfulpeople

  end
  def successticket
    @ticket = @task.newsuccessticket
    @people=@task.successfulpeople

  end
  def iaccomplishedthistask
@taskshaveaccomplishment=   @task.myaccomplishments1
  end
  def confirmdelete
    
  end
  def deletetask
    @task.destroy
    redirect_to tasks_path
  end
  def showcollections
    @tasks2=Task.findwithdata(*some_params.values)
    if @tasks2.length > 0
    render layout: false
    else
      render inline: "", layout: false
    end
  end
  # GET /tasks
  # GET /tasks.json
  def setoftasks
    myparams=post_params.dig(:postlikecomments_attributes,'0', 'setoftask_attributes').as_json
    p myparams
    @setoftasks = Setoftask.find(myparams['id']) rescue Setoftask.find_or_create_by(title: myparams['title']) 
    @setoftasks.update(myparams)
    render layout: false
  end
  def messageforyou
    @posts= @task.supportmessages
  end
  def tachesfetiches
    @tachesmentions = Task.plusmentions

  end
  def showplaces
    render locals: {lieux: @task.get_otherplaces}
  end
  def nearbyplaces
    render locals: {lieux: @task.aproximite}
  end

  def index
@g=params[:page].to_i
      #@people=Person.all.joins(:collections).group_by {|x| x['collections.name']}
      @tasks=Task.bypage(params[:page].to_i)


    respond_to do |format|
      format.html
      format.js {render :edit}
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
@task||=Task.find(params[:taskid])

    respond_to do |format|
      format.html
      format.js {render :edit}
    end
  end

  # GET /tasks/new
  def new
    @task = Task.new


    respond_to do |format|
      format.html
      format.js {render :edit}
    end
  end

  # GET /tasks/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js {render :edit}
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
Thing.all.each do |thing|
trouve=(1..5).map {|x| [params["#{thing.id}thing#{x}.x"],x]}.select{|x|x[0]}[0] rescue nil
val=trouve ? trouve[0] : nil
int=trouve ? trouve[1] : nil
if int && val && val != '0'
@task.taskusedstuffs.create!(user: current_user, thing_id: thing.id,use: int)
end
end


        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      else
	p @task.errors
  p @task.sailorjobs[0].errors
        format.html { render :new }
      format.js {render :edit}
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if params[:mytasks]=='true' && @task.update(task_params)
        format.html { render inline: "ok well done <button type=\"button\" class=\"mycoltasksclose\">&times;</button>", layout: false }

      elsif @task.update(task_params)
Thing.all.each do |thing|
trouve=(1..5).map {|x| [params["#{thing.id}thing#{x}.x"],x]}.select{|x|x[0]}[0] rescue nil
boisson=(1..5).map {|x| [params["#{thing.id}drink#{x}.x"],x]}.select{|x|x[0]}[0] rescue nil
val=trouve ? trouve[0] : nil
int=trouve ? trouve[1] : nil
valboisson=boisson ? boisson[0] : nil
intboisson=boisson ? boisson[1] : nil
if int && val && val != '0'
@task.taskusedstuffs.find_or_create_by(user: current_user, thing_id: thing.id,use: int)
end
if intboisson && valboisson && valboisson != '0'
@task.drinkthingtasks.find_or_create_by(user: current_user, drink_id: thing.id,qty: intboisson)
end
end
@task.drinkthingtasks.each do |t|
j= params["personid#{t.id}"]
if j 
t.update(person_id: j)
end
end
@task.taskusedstuffs.each do |t|

i= params["#{t.thing.id}nb"]
if i
t.update(nb: i)
end
end
       @star=(1..5).to_a.map {|x| [params["#{x}star.x"],x]}.select{|x|x[0]}[0][1] rescue nil
       if @star
         @task.starattitudes.last.update(star: @star)
       end


        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      else
        	p @task.errors

        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def events
    @event = Event.new
    render :events
  end
    def relatedtasks
@task = Task.find(params[:id])
rescue ActiveRecord::RecordNotFound
      @task = Routine.find(params[:id])

    end
  private
  # Use callbacks to share common setup or constraints between actions.
  def load_collection
    @cid=params[:cid] ? Collection.find(params[:cid]) : Collection.first
        @ids=params[:ids] ? Person.where(id: params[:ids].split(',')) : nil
@hackedpeopletype = params[:hpt] || nil

  end
  def set_task
    @task = Task.find(params[:id]) rescue Task.new || Task.new
    @sot=@setoftask = Setoftask.find(params[:setoftask_id]) rescue Setoftask.new || Setoftask.new
  end
  def set_people
    @people=[]
    @people=(@task.sailors+(params[:peopletoadd] && params[:peopletoadd].length > 4 ? Person.where('lower(name) like ?',"%#{params[:peopletoadd].downcase}%") : []).to_a+Person.where(id: params[:people]).to_a).to_a.uniq
  end
  def some_params
[:stateid,:cityid, :tvseriesid,:namesailor].map {|x| params[x]}
  end
  def post_params
    params.require(:post).permit(:postlikecomments_attributes=>{})
  end
  def task_params
    params.require(:task).permit(:length_a,:length_b,:name_en,:name_de,:name_fr,:validatetickets,:unvalidatetickets,:everyone,:happened,:image,:newnamecollection,:nbtimes, :idoit, :type, :manner_id, :description,:end_at,:event_type_id, :start_at, :longitude, :person_id, :latitude, :city_id, :place_id, :state_id,:country_id, :address, :name,:eventid,:personid,:taskshaveaccomplishments_attributes=>{},:grouptasks_attributes=>{},:relatedperson_ids=>[],:starattitudes_attributes=>[:winningattitude_id, :user_id],:gossip_ids=>[],:mycollection_ids=>[],:addresses_attributes=>{}, :accomplishedsailor_ids=>[],:sailor_ids=>[], :relatedtask_ids=>[],:relatedtasksinputs=>[],:mycollection_ids=>[],:sailorsinputs=>[],:person_ids=>[],:event_ids=>[],:relatedpeopleinputs=>[],:task_ids=>[],:presentperson_ids=>[],:place_ids=>[],:thing_ids=>[],:linkedtask_ids=>[],:recordmyphrasesandwords=>[], :sailorhavingthistask=>[],:recordmywords=>[],:mytaskwiththerecording=>[],:myownphrasesandwords=>[], :contentmyownphrasesandwords=>[], :myownwords=>[],:contentmyownwords=>[], :recordmyphrasesandwords1=>[],:recordmywords1=>[],:myownphrasesandwords1=>[],:contentmyownphrasesandwords1=>[],:myownwords1=>[],:contentmyownwords1=>[],:recordmyphrasesandwords2=>[],:recordmywords2=>[],:myownphrasesandwords2=>[],:contentmyownphrasesandwords2=>[],:myownwords2=>[],:contentmyownwords2=>[],:addmyrelation_id=>[], :addmyrelation_text=>[],:addmybigrelation_id=>[],:addmymiddlerelation_id=>[], :mysailorsgetter=>[],:tvseries_ids=>[],:relatedtask_ids=>[],:attitude_ids=>[],:worktwo_ids=>[],:taskaction_ids=>[],:githubrepo_ids=>[],:epoch_ids=>[],:ticket_ids=>[],:failingticket_ids=>[],:google_request_ids=>[],:recording_ids=>[],:tvseries_ids=>[],:film_ids=>[],:followingtask_ids=>[],:song_ids=>[],:tasktype_ids=>[])
  end
end
