class RsmaController < ApplicationController
layout false, only: [:wantedid, :notwantedid]
  def wantedid
@couples=Linkspouseperson.findbyid(params[:id])
  end
  def notwantedid
@couples=Linkspouseperson.findbyid(params[:id])
  end
  def loveisland1
  end
  def loveisland2
    @loveisland=Loveisland.find_or_create_by(loveisland_params)
  end
  def candlelight1


  end
  def candlelight2


  end
  def candlelight3 
    @person=Person.find((Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil))

  end
  def candlelight4
    @person=Person.find(params[:person])
    @otherperson=Person.find((Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil))

  end
  def candlelight5
    @person=Person.find(params[:person])
    @otherperson=Person.find(params[:otherperson])
    @task=Task.find((Task.all.ids.map {|x| [params["#{x}task.x"],x]}.select{|x|x[0]}[0][1] rescue nil))
    @candlelightdinner=Candlelightdinner.find_or_create_by(task:@task, person: @person, otherperson: @otherperson,date: params[:date])

  end
  def wrongtask1


  end
  def wrongperson1
    @task=Task.find((Task.all.ids.map {|x| [params["#{x}task.x"],x]}.select{|x|x[0]}[0][1] rescue nil))
  end
  def wrongtask2
    @task=Task.find(params[:mytaskid])
    @person=Person.find((Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil))
  end
  def wrongperson2
    @othertask=Task.find((Task.all.ids.map {|x| [params["#{x}task.x"],x]}.select{|x|x[0]}[0][1] rescue nil))
    @task=Task.find(params[:mytaskid])
    @person=Person.find(params[:mypersonid])
  end
  def wrongpersontask
    @task=Task.find(params[:mytaskid])
    @person=Person.find(params[:mypersonid])
    @othertask=Task.find(params[:myothertaskid])
    @otherperson=Person.find((Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil))
@w1=Sailorjob.find_or_create_by(sailor: @person, task: @task)
@w2=Sailorjob.find_or_create_by(sailor: @otherperson, task: @othertask)
    @w=Wrongtask.find_or_create_by(wrongsailorjob: @w1, suggestedsailorjob: @w2)
  end
  private
  def loveisland_params
    params.require(:loveisland).permit(:wantedcouple_id, :notwantedcouple_id)
  end

end
