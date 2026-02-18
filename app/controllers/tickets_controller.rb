class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ editmessagecontent editrecipients editsenders myticket addmessage editalltasks tasksforvalidation tasksforunvalidation show edit update destroy ]
before_action :for_senders_and_recipients
layout false, only: [:linkspousepeople, :linkfamilypeople, :worktwos]
def json
      @t=Ticket.findbyname(params[:name])
      render json: @t
end
def worktwos
@worktwos=Worktwo.findbyid(params[:id])
end
def linkfamilypeople
@linkfamilypeople=Linkfamilyperson.findbyid(params[:id])
end
def linkspousepeople
@linkspousepeople=Linkspouseperson.findbyid(params[:id])
end
def cbsenders

render layout: false
end
def cbrecipients
render layout: false
end
  def route1
      name=params[:name]
      s="%#{name.squish.strip.gsub(' ','%')}%"
      @people=Person.where('lower(name) like ? or lower(lastname) like ? or lower(firstnames) like ?',s,s,s)
render json: @people



end
def route2
      id=params[:id]
      @people=Person.where(id: id)
render :mypeople, layout: false
end
  def editmessagecontent
end
  def editsender
end
  def editrecipients
end
  def addmessage
    render layout: false
  end
  def severalticketsandtasks
    @tickets = Ticket.all
  end
  def editalltasks
    
  end
  def tasksforvalidation
    
  end
  def tasksforunvalidation
    
  end
  # GET /tickets or /tickets.json
  def recipients
    @ticket=Ticket.new(ticket_params)
  end
  def messagecontent
    k = params[:myoldticket]
    if k
    @t=Ticket.find(k)
    @ticket=@t.dup
	@ticket.recipients = @t.senders
	@ticket.senders = @t.recipients
	@ticket.aboutpeople = @t.aboutpeople
	@ticket.recipient = @t.sender
	@ticket.sender = @t.recipient
	@ticket.textcontent = nil
    else
    @ticket=Ticket.new(ticket_params)
    end
    @ticket.thereissender = true
    @ticket.thereisrecipient = true
    @ticket.senderknown = true
    @ticket.recipientknown = true
  end
  def index
    @tickets = Ticket.all
  end
  def tasks
    person=Person.find(params[:person]) rescue nil
    #@tasks1 = task.tasks rescue []
    @tasks2 = person.todojobs.joins(:mycollections).select('taskcollections.*,events.*,taskcollections.name as myname').group_by {|x| x["myname"]} rescue []
    p @tasks2.to_a[0]
    @nametable = params[:task] == "valid" ? :validatedtask_ids : :unvalidatedtask_ids
    if @tasks2.length > 0
    render layout: false, locals: {nomtable: @nametable}
    else
      render inline: "pas de tâches enregistrées pour #{person.name}", layout: false
    end
  end
  def taskstoussailors
    @path=""
    t=params[:task]
    @mytest= t == "valid"
        @validtable = @mytest ? "valid" : "unvalid"
        @nametable = @mytest ? "validated" : "canceled"
        @nametable2 = @mytest ? "valident" : "annulent"
        @nametable3 = @mytest ? "valider" : "annuler"

    people=params[:mysailors2]
    @people=Person.where(id: people)
    ticket_ids=params[:myticket].select {|a,b| b == "1"}.keys rescue nil
    task_ids=params[:mytask].select {|a,b| b == "1"}.keys rescue nil
    #@tasks1 = task.tasks rescue []
    @tickets=Ticket.where(id: ticket_ids)
    @tasks=Task.where(id: task_ids)
    @tasks2 = Task.joins(:sailors).where("people.id" => people).joins(:mycollections).select('taskcollections.*,events.*,events.name as taskname,taskcollections.name as myname').group_by {|x| x["myname"]} rescue []
    p @tasks2.to_a[0]
        if people.length > 0 && @tickets.length > 0 && @tasks.length > 0
        if @mytest
          @tickets.each {|y| y.validatedtasks << @tasks}
        else
          @tickets.each {|y| y.unvalidatedtasks << @tasks}
        end
              render inline: "Job done pour série de tâches #{@tasks.pluck(:name).join(', ')}", layout: false

      
    else

    if @tasks2.length > 0
    render layout: false, locals: {nomtable: @nametable}
    else
      render inline: "pas de tâches enregistrées pour #{@people.pluck(:name).join(', ')}", layout: false
    end
    end
  end
  # GET /tickets/1 or /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets or /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
if params[:task] && (params['didthetask.x'] || params['didnotdotask.y'])
@task=Task.find(params[:task])
@task.successfultickets.delete(@ticket)
@task.failingtickets.delete(@ticket)
if params['didthetask.y']

@task.successfultickets << @ticket
elsif params['didnotdotask.y']
@task.failingtickets << @ticket
end
end

        format.html { redirect_to @ticket, notice: "Ticket was successfully created." }
        format.json { render :show, status: :created, location: @ticket }
      else
        p @ticket.errors
        p @ticket.senders[0].errors
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
if params[:task] && (params['didthetask.x'] || params['didnotdotask.y'])
@task=Task.find(params[:task])
@task.successfultickets.delete(@ticket)
@task.failingtickets.delete(@ticket)
if params['didthetask.y']

@task.successfultickets << @ticket
elsif params['didnotdotask.y']
@task.failingtickets << @ticket
end
end

        format.html { redirect_to @ticket, notice: "Ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end
  def myticket
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { render inline: "Ticket was successfully updated.", layout: false }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :addmessage, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: "Ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:content_en,:content_fr,:content_de,:contentknown,:message_id,:canceltask,:thereissender, :thereisrecipient, :senderknown, :recipientknown, :sender, :recipient, :textcontent,:messages_attributes=>{}, :recipient_ids=>[], :sender_ids=>[],:aboutperson_ids=>[], :validatedtask_ids=>[], :unvalidatedtask_ids=>[],:worktwo_ids=>[],:linkspouseperson_ids=>[],:linkfamilyperson_ids=>[],:message_attributes=>{})
    end
def for_senders_and_recipients
      id=params[:id]
      @people=Person.where(id: id)

end
end
