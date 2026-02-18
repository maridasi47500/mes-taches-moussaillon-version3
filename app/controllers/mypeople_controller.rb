class MypeopleController < ApplicationController
layout false,only:[:findppl]
def comptemangeantrepas
params[:people]=params[:people].split('-')
params[:days].each do |g|
Personrepas.create(repasjour:g.split(' ')[2],date: g.split(' ')[0], person_id: g.split(' ')[1],user: current_user)
end
@people=Person.where(id: params[:people])
render :comptemangeantsuite
end
def seeposts
@posts=Post.findbycontent(params[:content])
@pagination=[]
@allposts=[]
render :myposts

end
def comptemangeantsuite
@people=Person.where(id: params[:people])
end
  def findppl
@person=Person.find(params[:id])
 end
 def seestars
@people=Person.findbyname(params[:nomdumoussaillon]).where(celeb: true)
render :seestars
 end
 
def seesentences
          @n=params[:contentsentence]
      @o='%'+@n.gsub(' ','%').downcase+'%'
        @s=ReactionsText.where("name_#{I18n.locale.to_s} like ?",@o)

end
def seeavatars
          @n=params[:nomavatar]
      @o='%'+@n.gsub(' ','%').downcase+'%'
        @avatars=PostsSurname.findthem(@o).nopage(params[:page])

end
def seesurnames
@surnames=Surname.findbyname(params[:nomsurname])
render :seesurnames
 end
 def seeattitudes
@attitudes=Attitude.findbyname(params[:s])
@attitude=Attitude.new(search: params[:s])
 end
 def seetasks
@tasks=Task.findbyname(params[:nomtache])
render :seetasks
 end
 def seeppl
@people=Person.pasceuxdestvseries.notfrommovies.find1ppl(params[:nomdumoussaillon])
render :see
 end
 def seeactor
@people=Person.findactor(params[:tvseriesid],params[:nomacteur],params[:filmid])
render :see
 end
end
