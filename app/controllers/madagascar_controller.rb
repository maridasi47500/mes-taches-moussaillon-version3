class MadagascarController < ApplicationController
  layout false, only: [:ordures, :cuisinier]
before_action :findpeople, only: [:ordures, :cuisinier]
 def dormitory
 end
 def rolesmembres
end
  def membresfoyer
    @m=User.findbyname(params[:name])
    render json: @m
  end
  def changecuisinier
render template: "devise/registrations/cuisinier.html.erb"
  end
  def changehommemenage
render template: "devise/registrations/ordures.html.erb"
  end
  def ordures

  end
  def cuisinier
  end
  def menage

  end
  def cuisine
  end
  def lemenage

  end
def actionmenage
#["membre.jpg", "trash.png", "wc2.jpg", "sol2.png", "vitre2.jpg", "food2.png", "broom1.jpg", "broom.jpg", "ustencils.jpg"].each do |t|
@j=["trash.png", "wc2.jpg", "sol2.png", "vitre2.jpg", "broom1.jpg", "broom.jpg", "ustencils.jpg","food2.png"]
    @jj=@j.map{|k|k.gsub('.jpg','.x').gsub('.png','.x')}
@jir=@jj.select{|x|params[x]}
if params['cuisine.x']
redirect_to madagascar_cuisine_path
elsif params['menage.x']
redirect_to madagascar_lemenage_path
elsif params['trosa.x']
redirect_to depenses_path
elsif params['argent.x']
redirect_to argent_index_path
elsif params['membre.x']
redirect_to madagascar_rolesmembres_path
elsif @jj.any? {|x|params[x]}

    @image = @j.select{|x| x.split('.')[0] == @jir[0].split('.')[0]}[0]
    @foyertask = Foyertask.new(image:@image,nomtachepasse: t('jiramapasse.'+@jir[0].gsub('.x','')),nomtache: t('jiramapresent.'+@jir[0].gsub('.x','')),user1:current_user.id)
@actionlaver=@jir[0].gsub('.x','')

render template: "foyertasks/new"
  end
end
private
def findpeople
@people=Person.findbyid(params[:id])
end
end
