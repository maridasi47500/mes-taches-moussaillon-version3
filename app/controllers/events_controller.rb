class EventsController < ApplicationController
  before_action :set_event, only: [:removebasket, :addbasket,:show, :edit, :update, :destroy]
before_action :load_collection
  # GET /events
  # GET /events.json
  def json
@e=Event.findbyname(params[:name])
render json: @e
  end
    def clearbasket
      session[:basketevents] = []
      @basketevents = Event.where(id: session[:basketevents].to_a)
      render inline: "<%= render partial: 'things/displaybasket' %>"
    end
    def addbasket
      session[:basketevents] ||= []
      session[:basketevents] = session[:basketevents].to_a.push(@event.id)
      @basketevents = Event.where(id: session[:basketevents].to_a)
      render inline: "<%= render partial: 'things/displaybasket' %>"
    end
    def removebasket
      @list=session[:basketevents].to_a
      p @list
      @list.delete(params[:id].to_i)
      session[:basketevents] = @list
      p session[:basketevents]
      @basketevents = Event.where(id: session[:basketevents].to_a)

      render inline: "<%= render partial: 'things/displaybasket' %>"
    end

  def index
    @events = Event.all
        respond_to do |format|
          format.html
      format.js {render :edit}
        end
  end

  # GET /events/1
  # GET /events/1.json
  def show
        respond_to do |format|
          format.html
      format.js {render :edit}
        end

  end

  # GET /events/new
  def new
    @event = Event.new
        respond_to do |format|
          format.html
      format.js {render :edit}
        end

  end

  # GET /events/1/edit
  def edit
        respond_to do |format|
          format.html
      format.js {render :edit}
        end

  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.js {render :edit}
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.js {render :edit}
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def tasks
    @task = Task.new
    render :tasks
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end
  def load_collection
        @ids=params[:ids] ? Person.where(id: params[:ids].split(',')) : nil
@hackedpeopletype = params[:hpt] || nil

  end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name_en,:name_fr,:name_de,:end_at, :start_at, :longitude, :latitude, :city_id, :place_id, :state_id, :address, :name, :taskid, :personid,:relatedevent_ids=>[],:presentperson_ids=>[],:sailor_ids=>[],:task_ids=>[])
    end
end
