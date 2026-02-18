class TorolananaController < ApplicationController
#`protect_from_forgery except: [:all]
def leslaureats
@people=Persongraduatedschool.order('persongraduatedschools.schoolhperson_id' => :asc).joins(:photos).select('persongraduatedschools.*,count(photos.id) as countphoto').group('persongraduatedschools.id').having('countphoto > 0')
end
def showmy
@sector=Sector.find(params[:id])

end
def add
@sector=Sector.find(params[:id])
current_user.sectors << [@sector]
redirect_to mytorolanana_path
end
def allto
@sectors=Sector.findbycriterion(params[:city],params[:myfield],params[:seriebac],params[:field])
render :all

end
def mytorolanana
@sectors=current_user.sectors
end
  def index
  end
end
