class MistralfmController < ApplicationController
before_action :set_person, only: [:socialnetwork,:allactors,:ustensiles,:instrument]
def ustensiles
@ustensile=Ustensile.find(params[:uid])
render layout: false
end
def instrument
@instrument=Musicalinstrument.find(params[:iid])
render layout: false
end
def langages
@langage=Programminglanguage.find(params[:iid])
render layout: false
end
  def alltheactors
if params[:name] == '' && params[:tvseriesid] != ''
@people=Tvseries.find(params[:tvseriesid]).actors
elsif params[:name] == '' && params[:tvseriesid] == ''
@people=Film.find(params[:filmid]).actors
else

@people=Person.findactor(params[:tvseriesid],params[:name],params[:filmid])
end

render json: @people
  end
def allactors
render layout: false
end
  def alltheppl
@people=Person.lookforname(params[:name]).joins(:rcars)
render json: @people
  end
  def allthehits
@person=Person.find(params[:id])
@person.userid=current_user.id

render :alltheits, layout:false
  end
  def theits

@person=Person.find(params[:id])
@person.userid=current_user.id
render layout:false
  end
  def index
  end
def socialnetwork
if params['fille.x']
@person.sexe='F'
@person.save
elsif params['garcon.x']
@person.sexe='M'
@person.save
elsif params['lovefeeling']
p=@person.inloves.find(params['lovefeeling'])
@person.inloves.delete(p)
elsif params['artistepeople']
p=@person.artistpeople.find(params['artistepeople'])
@person.artistpeople.delete(p)
elsif params['langage1.x'] || params['langage2.x'] || params['langage3.x']|| params['langage4.x']|| params['langage5.x']
int=(1..5).map {|x| [params["langage#{x}.x"],x]}.select{|x|x[0]}[0][1]
@person.artistpeople.create(practice: int,artobject_id:params[:piid], person: @person, user: current_user)

elsif params['art1.x'] || params['art2.x'] || params['art3.x']|| params['art4.x']|| params['art5.x']
int=(1..5).map {|x| [params["art#{x}.x"],x]}.select{|x|x[0]}[0][1]
@person.artistpeople.create(practice: int,artobject_id:params[:uaid], person: @person, user: current_user)
elsif params['musici1.x'] || params['musici2.x'] || params['musici3.x']|| params['musici4.x']|| params['musici5.x']
int=(1..5).map {|x| [params["musici#{x}.x"],x]}.select{|x|x[0]}[0][1]
@person.artistpeople.create(practice: int,artobject_id:params[:miid], person: @person, user: current_user)
elsif params['music1.x'] || params['music2.x'] || params['music3.x']|| params['music4.x']|| params['music5.x']
int=(1..5).map {|x| [params["music#{x}.x"],x]}.select{|x|x[0]}[0][1]
@person.artistpeople.create(practice: int, artobject_id:params[:miid], person: @person, user: current_user)
elsif params[:suppravistv]
@avis=Attitudetvseries.find(params[:avis])
@avis.destroy
elsif params['tvser1.x'] || params['tvser2.x'] || params['tvser3.x']|| params['tvser4.x']|| params['tvser5.x']
int=(1..5).map {|x| [params["tvser#{x}.x"],x]}.select{|x|x[0]}[0][1]
ser= params[:tvser001]
filmid=params[:film001]
if ser
@tvser=@person.attitudetvseries.create(note: int, attitude_id:(params[:attid].to_i > 0 ? params[:attid] : params[:attitudeid]), person: @person, user: current_user,tvseries_id: ser)
p @tvser.errors

elsif filmid
@person.attitudefilms.create(note: int, attitude_id:(params[:attid]||params[:attitudeid]), person: @person, user: @user,film_id: filmid)
redirect_to films_path
end
elsif params['aime1.x'] || params['aime2.x'] || params['aime3.x']|| params['aime4.x']|| params['aime5.x']

int=(1..5).map {|x| [params["aime#{x}.x"],x]}.select{|x|x[0]}[0][1]
if params[:personid]
@person.inloves.create!(otherperson_id: params[:personid],user:current_user, intensity: int)
else
@person.peoplelike.create!(user:current_user, intensity: int)
end
elsif params['lgbt.x']
@person.lgbtgens << [current_user]
elsif params['car.x']
@person.voituregens << [current_user]
elsif params['rbs.x']
@person.braceletgens << [current_user]
elsif params['robot.x']
@person.robotgens << [current_user]
elsif params['believer.x']
@person.croyantgens << [current_user]
elsif params['aimepas.x']
@person.aimepasgens << [current_user]
elsif params['saved.x']
@person.sauvegens << [current_user]
elsif params['nocar.x']
@person.peoplecars.where(user:current_user).destroy_all
elsif params['answer.x']
if params[:ansid].is_a?(Array)
params[:ansid].each do |a|
@person.answerpeople.create(user: current_user, question_id: params[:qid], answer_id: a)
rescue
end
else
@person.answerpeople.create(user: current_user, question_id: params[:qid], answer_id: params[:ansid])

end
elsif params[:voitureid].to_s != ''
@person.peoplecars.create(user:current_user, car_id: params[:voitureid])

  end
@person.update(myperson_params)
if ser || params[:suppravistv]
redirect_to tvseries_index_path
else
render :opinion, layout: false
end
rescue ActiveRecord::RecordInvalid
render :opinion, layout: false
rescue ActiveModel::MissingAttributeError
render :opinion, layout: false

end
private
def myperson_params
params.permit(:userid,:rbs,:lgbt,:robot,:car,:sauve,:monamour,:cargen_ids=>[],:thing_ids=>[])
end
def set_person
@person=Person.find(params[:id])
end
end
