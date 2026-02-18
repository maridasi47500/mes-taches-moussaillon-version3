class LaundryjiramapeopleController < ApplicationController
layout false, only: [:jiramapeople,:person1,:person2,:grade1,:grade2,:inersesalut]
before_action :findpeople, only: [:person1,:person2]
before_action :findarmygrade, only: [:grade1,:grade2]

  def json
    @j=Laundryjiramaperson.findbyname(params[:name])
    render json: @j
  end
  def inversesalut
    @s=Salutmilitaire.inverse(params[:id])
    render @s
  end
  def person1

  end
  def person2
  end
  def grade1
  end
  def grade2
  end
  def monsalutmilitaire
@l =Laundryjiramaperson.createonesalut(params[:person1_id],params[:person2_id],params[:grade1_id],params[:grade2_id],current_user)
@l.tickets.new(recipient:Person.find(params[:person2_id]).name,sender: Person.find(params[:person1_id]).name)
  end
  def salutmilitaire
  end
  def capitaine
int=Laundryjiramaperson.all.ids.map {|x| [params["#{x}laundry.x"],x]}.select{|x|x[0]}[0][1]
@laundry1=Laundryjiramaperson.find(params[:id])
@laundry2=Laundryjiramaperson.find(int)
@captain=Laundrycaptain.create(laundryjiramaperson: @laundry1,laundryjiramaotherperson: @laundry2)
redirect_to laundryjiramaperson_laundrycaptain_path(id: @captain.id,laundryjiramaperson_id: @laundry1)

  end
  def jsonjirama
@laundry=Laundryjiramaperson.findbyname(params[:name])
render json: @laundry
    
  end
  def jiramapeople
@laundry=Laundryjiramaperson.find(params[:id])
@person=Person.find(params[:person_id])
@grade=Grade.find(params[:grade_id])
@armygrade=Armygrade.find(params[:armygrade_id])
@epoch=Epoch.find(params[:epoch_id])
@user=User.find(params[:user_id])
  end
  def show
@laundry=Laundryjiramaperson.find(params[:id])
@person=Person.find(params[:person_id])
@grade=Grade.find(params[:grade_id])
@armygrade=Armygrade.find(params[:armygrade_id])
@epoch=Epoch.find(params[:epoch_id])
@user=User.find(params[:user_id])

  end
private
def findpeople
@people=Person.findbyid(params[:id])
end
def findarmygrade
@armygrades=Armygrade.findbyid(params[:id])

end
end
