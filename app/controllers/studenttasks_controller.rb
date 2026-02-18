class StudenttasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update]

def people
      id=params[:id]
      @people=Person.where(id: id)
render layout: false
end

  def create
    @task = Studenttask.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_collections_path, notice: 'Task was successfully created.' }
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
  def update
    respond_to do |format|
      if params[:mytasks]=='true' && @task.update(task_params)
        format.html { render inline: "ok well done <button type=\"button\" class=\"mycoltasksclose\">&times;</button>", layout: false }

      elsif @task.update(task_params)

        format.html { redirect_to tasks_collections_path, notice: 'Task was successfully updated.' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      else
                p @task.errors

        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end


  def index
@studenttasks=Studenttask.all
  end

  def show
@task=Studenttask.find(params[:id])
  end
  def edit
@task=Studenttask.find(params[:id])
  end
  def new
@task=Studenttask.new
  end
private
  def task_params
    params.require(:studenttask).permit(:validatetickets,:unvalidatetickets,:everyone,:happened,:image,:newnamecollection,:nbtimes, :idoit, :type, :manner_id, :description,:end_at,:event_type_id, :start_at, :longitude, :person_id, :latitude, :city_id, :place_id, :state_id,:country_id, :address, :name,:eventid,:personid,:taskshaveaccomplishments_attributes=>{},:relatedperson_ids=>[],:gossip_ids=>[],:mycollection_ids=>[],:addresses_attributes=>{}, :accomplishedsailor_ids=>[],:sailor_ids=>[], :relatedtask_ids=>[],:relatedtasksinputs=>[],:mycollection_ids=>[],:sailorsinputs=>[],:person_ids=>[],:event_ids=>[],:relatedpeopleinputs=>[],:task_ids=>[],:presentperson_ids=>[],:place_ids=>[],:thing_ids=>[],:linkedtask_ids=>[],:recordmyphrasesandwords=>[], :sailorhavingthistask=>[],:recordmywords=>[],:mytaskwiththerecording=>[],:myownphrasesandwords=>[], :contentmyownphrasesandwords=>[], :myownwords=>[],:contentmyownwords=>[], :recordmyphrasesandwords1=>[],:recordmywords1=>[],:myownphrasesandwords1=>[],:contentmyownphrasesandwords1=>[],:myownwords1=>[],:contentmyownwords1=>[],:recordmyphrasesandwords2=>[],:recordmywords2=>[],:myownphrasesandwords2=>[],:contentmyownphrasesandwords2=>[],:myownwords2=>[],:contentmyownwords2=>[],:addmyrelation_id=>[], :addmyrelation_text=>[],:addmybigrelation_id=>[],:addmymiddlerelation_id=>[], :mysailorsgetter=>[],:tvseries_ids=>[])
  end
  def set_task
    @task = Studenttask.find(params[:id]) rescue Task.new || Task.new
  end

end
