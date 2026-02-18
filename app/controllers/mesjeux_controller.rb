class MesjeuxController < ApplicationController
  def index
@people=Person.all.sample(40)
  end
  def trouverunrobot
                @int=Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil
Rrobot.create(user: current_user, person_id: @int)
redirect_to mesjeux_index_path, notice: @int

  end
def whoisrobot
@person=Person.joins(:rrobots).sample
@people=Person.joins(:rrobots)

end
def identifyrobot
if params[:robot] == Person.find(params[:personid]).name
redirect_to whoisrobot_path, notice: 'ok'
else
redirect_to whoisrobot_path, notice: 'no'
end
end
end
