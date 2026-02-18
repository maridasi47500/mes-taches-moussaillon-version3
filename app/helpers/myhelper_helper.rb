module MyhelperHelper
def allmybacseries
@bacseries=Bacseries.findbyid(params[:id])
end
def allmymusicalinstruments
@musicalinstruments=Musicalinstrument.findbyid(params[:id])
end
def allmytaskactions
@taskactions=Taskaction.findbyid(params[:id])
end
def allmypeople
@people=Person.findbyid(params[:id])
end
def allmylinks
@links=Familylink.findbyid(params[:id])
end
def allthecars
k=Peoplecar.find_or_create_by(car_id: params[:myid], user: current_user,person_id: params[:id])
@cars=Peoplecar.where(car_id: params[:myid], user: current_user,person_id: params[:id])

end
def alltheradios
@radios = Radio.findbyid(params[:id])
end
def allthehotels
@hotels = Hotel.findbyid(params[:id])
end
def allthefactoriesservicehaveemployees
    @factoriesservicehaveemployees = Factoriesservicehaveemployee.findbyname(params[:name]).map do |y|
       z=y.name
       a=y.as_json
       a['name'] = z
       a 
    end
end
def factoryservicehasemployee
    @factoriesservicehaveemployees = Factoriesservicehaveemployee.findbyid(params[:id])
end
def allpeoplewhohavejobs
    @peoplehavejobs = Peoplehavejob.findbyname(params[:name]).map do |y|
       z=y.name
       a=y.as_json
       a['name'] = z
       a 
    end

end
def allpostssurnames

    @posts_surnames = PostsSurname.findbyid(params[:id])
end
def alllinkspousepeople

    @linkspousepeople = Linkspouseperson.findbyid(params[:id])
end
def allthetwitteraccounts

    @twitteraccounts = Twitteraccount.findbyid(params[:id])
end
def personwhohasjob

    @peoplehavejobs = Peoplehavejob.findbyid(params[:id])
end
def allthefactories
    @factories = Factory.findbyid(params[:id])
end
def alltheepochs
    @epochs = Epoch.findbyid(params[:id])
end
def allmycountries
    @countries = Country.findbyid(params[:id])
end
def allmycities
    @cities = City.findbyid(params[:id])
end
def find_allthecities
    @cities = City.findbyid(params[:id])
end
def find_youraliases
    @aliases = Alias.createwithiduser(params[:myid],current_user)
end
def find_aliases
    @aliases = Alias.findbyiduser(params[:myid],current_user)
end
def find_emoticons
    @emoticons = Emoticon.findbyid(params[:id])
end
def allthewebsites
    @websites = Website.findbyid(params[:id])
end
def allthetvseriesactors
    @people=@tvserieshaveactors = Tvserieshaveactor.findbyid(params[:id])
end
def alltheemoticons
    @emoticons = Emoticon.findbyid(params[:id])
end
def allthetrophies
    @trophies = Trophy.findbyid(params[:id])
end
def allthesurnames
    @surnames = Surname.findbyid(params[:id])
end
def alltherequeststopeople
    @requeststopeople = Requeststoperson.findbyid(params[:id])
end
def allthephotos
    @photos = Photo.findbyid(params[:id])
end
    def pagination
              page=params[:page] || 0
        @nopage  = page.to_i
    margin=10
    @minpage= (5-@nopage) <= 5 && (5-@nopage) >= 0 ? 0 : (@nopage - 5)

    @pagination=(@minpage..(@nopage+margin)).to_a

    end

  def self.html_format(str)
    process(str)
  end

  def allthecountries
    @countries = Country.findbyid(params[:id])
  end
  def find_people
    @people = Person.findbyid(params[:id])
  end
  def find_peoplemyid
    @people = Person.findbyid(params[:myid])
  end
  def allthepeople
    @people = Person.findbyid(params[:id])
  end
end
