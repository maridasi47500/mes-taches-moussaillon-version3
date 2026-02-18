class TaskusedstuffsController < ApplicationController
  before_action :set_taskusedstuff, only: [:whouse,:addpeoplelikethis]
  before_action :set_categorything, only: [:whouse,:addpeoplelikethis]
  def addpeoplelikethis
  end
  def whouse
    @people=Person.where(id: ((Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil)))
    @taskusedstuff.people << @people

 redirect_to addpeoplelikethis_categorything_taskusedstuff_path(@taskusedstuff.id,categorything_id: @categorything.id)
  end
  private
  def set_categorything
    @categorything = Categorything.find(params[:categorything_id])
  end
  def set_taskusedstuff
    @taskusedstuff = Taskusedstuff.find(params[:id])
  end
end
