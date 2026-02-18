class TasksailorusedstuffsController < ApplicationController


  before_action :set_tasksailorusedstuff, only: [:forwho,:addpeopleforwho]
  before_action :set_taskusedstuff, only: [:forwho,:addpeopleforwho]
  before_action :set_categorything, only: [:forwho,:addpeopleforwho]
  def addpeopleforwho
  end

  def forwho
    @people=Person.where(id: ((Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil)))
    @tasksailorusedstuff.people << @people

 redirect_to addpeopleforwho_categorything_taskusedstuff_tasksailorusedstuff_path(categorything_id:@categorything.id,taskusedstuff_id:@taskusedstuff.id,id:@tasksailorusedstuff.id)
  end
  private
  def set_tasksailorusedstuff
    @tasksailorusedstuff = Tasksailorusedstuff.find(params[:id])
  end
  def set_categorything
    @categorything = Categorything.find(params[:categorything_id])
  end
  def set_taskusedstuff
    @taskusedstuff = Taskusedstuff.find(params[:taskusedstuff_id])
  end

end
