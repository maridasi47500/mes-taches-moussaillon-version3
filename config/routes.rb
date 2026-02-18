Rails.application.routes.draw do
  resources :numbers
resources :citymayors do
collection do
get "city"
get "people"
end
end
resources :citynews do
collection do
get "city"

end
end
resources :mysentences do 
member do
get 'editother'
end
collection do
get 'ajouterrec'
get 'ajouterqch'
get 'thing'
get 'person'
end
end
resources :hardwareitems
resources :softwareitems
post "myroute",to:"welome#q"
resources :mydocs
resources :tasktypes
resources :armycompagnies do
collection do
get 'person'
end
end
get "myjobssectorspath", to: "users#mysectorstext", as: :mysectorstext_users
get "myjobsuserspath", to: "users#myjobstext", as: :myjobstext_users
get "myjobsusers", to: "users#myjobs", as: :myjobs_users
get "mysectors",to: "users#mysectors",as: :mysectors_users
resources :navettes do
collection do
get ":date",action: :bydate,as: :bydate,constraints: lambda{|req|DateTime.strptime(req.params[:date],I18n.t("date.formats")[:mydateurl]).to_date rescue nil}

get ":id",action: :show,constraints: lambda{|req|Navette.find(req.params[:id])}
get "new",action: :new,as: :new
get "person"
get "personnavette"

end
end
resources :mymenus do
member do
patch "choose"
end
end

resources :basic_guyacadeaux do
collection do
get "person"
get "address"
post "create",as: :createguya,action: :createguya
end
end
  resources :styleofmusics do
collection do
get "practicers"
get "json"
get "listeners"
end
member do
get "allpracticers"
get "alllisteners"
end
end
  resources :backgroundimages
resources :war_weapons
resources :vehicles
resources :fakecouples do
collection do
get "people"
get "otherpeople"
get "people1"
get "otherpeople1"
end
end
resources :fakearticles do
 member do
get "fake/:layouttype", action: :fake, as: :fake
end
end
resources :frontpages do
collection do
get "people"
end
end
resources :withorwithoutyous do
collection do
get "withyous"
get "withoutyous"
end
end
	resources :badges
    get "comptemangefindppl", to: "mypeople#findppl", as: :personid_mypeople
    resources :cles do
	collection do
	get 'people'
	end
	end
    post "comptemangeantrepas", to: "mypeople#comptemangeantrepas"
    post "comptemangeantsuite", to: "mypeople#comptemangeantsuite"
    get "comptemangeant", to: "mypeople#comptemangeant"
    post 'lookforavatars',to: 'mypeople#seeavatars', as: :seeavatars
    resources :episodes do
        collection do
            get "myactors"
            get "actors"
        end
    end
    resources :fakelinksfamilypeople do
        collection do
            get "people"
            get "otherpeople"
            get "links"
        end
    end
    resources :makeupstyles
    resources :haircolors
    resources :hairtypes
    resources :hairlengths
    resources :eyecolors
    resources :skin_colors
    resources :skin_types
    resources :clothescolors
    resources :faceshapes
    resources :bodydescriptions
  resources :olympiccountries, path: "olympiccountries", controller: "olympiccountries"
  resources :religions
  resources :etnicities
    post 'lookforsentences',to: 'mypeople#seesentences', as: :lookforsentences
    post 'lookforstars',to: 'mypeople#seestars', as: :lookforstars

    resources :editionshaveevents, path: 'results' do
        member do
            get 'ajouterunemedaille'
            get 'ajouterunemedaillerelay'
            post 'ajoutemedaille'
            post 'ajoutemedaillerelay'
        end
    end
  resources :editions do

  member do
     get "sports/:code", to: "olympicevents#showwithcode", as: :showpagewithcode, action: :showwithcode
  end
  end

  resources :computingstuffs do
    collection do
      get 'people'
    end
  end
  resources :factoryservices do
    collection do

      get 'factories'
      get 'people'
    end
  end
  resources :collections do
    collection do
      get 'people'
    end
  end
  resources :videogames
  resources :factorieshaveworkers do
    collection do
      get 'epochs'

    end
  end
  resources :petshaveowners do
    collection do
      get 'photos'

    end
  end
  
  resources :pets do
    collection do
      get 'owners'

    end
  end
  resources :internetpseudonyms do
    collection do
      get 'cities'
    end
  end
  resources :websites
  resources :togethertvseriesratings do
    collection do
      get 'myform'
      get 'people'
    end
  end
  get "leslaureats", to: 'torolanana#leslaureats'
  resources :aregoodrequests
  get 'trophies/json'
  resources :trophies do
    collection do
      get 'json'
    end
  end
  resources :persongraduatedschools do
    collection do
      get 'trophies'
      get 'photos'
    end
  end
  resources :personhavelifestates do
    collection do
      get 'requeststopeople'
      get 'photos'
    end
    member do
      get 'photos', as: :myphotos, action: :myphotos

    end
  end
  resources :lifestateshaverequests do
    collection do
      get 'requeststopeople'
    end
  end
  resources :personhavelifestateshavephotos do
    collection do
      get 'photos'
    end
  end 

  resources :lifestates do
    member do
      get 'mytickets/:person_id', as: :mytickets, action: :mytickets
    end
    collection do
      get 'people'
    end
  end
  resources :sailorjobhaveratings do
    collection do
      get 'sailorjobs'
    end
  end
  resources :sailorjobs do
    collection do
      get 'json'
    end
  end
  resources :fetes do
    collection do
      get 'countries'
    end
  end
  resources :sailorandactions do
    collection do
      get "sailors"
    end
  end
  resources :photoshavethings do
    collection do
      get "people"
    end
  end
  resources :salutmilitaires
  resources :factories do
    member do
	get 'spendonenight'
    end
    collection do
      get 'json'
      get 'workers'
      get 'hotels'
      get 'restaurants'
      get 'dishes'
      get 'aliases'
      get 'laundryjiramapeople'
    end
  end
  resources :traveltickets do
    collection do
	get 'aliases'
    end
  end
  resources :cities do
    member do
	get 'villagephotos'
	get 'searchpeople'

    end
    collection do
	get 'lookforpeople'

	post 'morepeoplejob'
	post 'addpeoplejob'

	post 'lookforsomebody'
	get 'lookforperson'
	get 'peoplehavecities'
	get 'json'
	get 'country'
	get 'state'
	get 'nationality'
    end
  end
  resources :secretoccupations do
    collection do
      get 'aliases'
      get 'people'
      get 'places'
    end
  end
  resources :concerts do
    collection do
      get 'city'
      get 'musicalscore'
      get 'musicalcomposition'
      get 'musician'
      get 'song'
    end
  end
  resources :idolcomments do
    collection do
      get 'jsonactor'
      get 'actor'
      get 'user'
    end
  end
  resources :requeststopeople do
    member do
      post 'asksotoo', action: :bestrequestpeople, as: :asksotoo
      post 'askso', action: :askso, as: :askso
      get 'askthatway/:requeststopersonhaverequestperson_id', action: :askthatway, as: :askthatway
      get 'bestrequestpeople'
      get 'newrequestpeople'
      get 'personabis'
      get 'personbbis'
    end
    collection do

      get 'json'
      get 'emoticons'
      get 'myaliases'
      get 'aliases'
      get 'persona'

      get 'personb'

    end
  end
  resources :rivals do
    collection do
      get 'fakelover'
      get 'reallover'
      get 'rivalpeople'
    end
  end
  resources :optiontasks
  resources :newspapers do
    collection do
      get 'json'
    end
  end
  resources :taskshaveaccomplishments
  resources :prejudices
  resources :prides do
   collection do
    get 'instructions'
   end
  end
  resources :actionlists
  get 'gg', to: 'rightaboutsomeones#goodgame', as: :goodgame
  resources :rightaboutsomeones do
    collection do
      get 'newaction'
      get 'newactionlist'
      get 'newphrase'
    end
    member do
      get 'telltruth'
      get 'startgame'
      post 'wrongta'
    end
  end
  resources :reactiontrueimages
  resources :emoticons do
    collection do
      get 'json'
    end
  end
  resources :winningattitudes do
    collection do
      get 'json'
      get 'people'
    end
  end
  resources :dupontsurnames do
    collection do
      get 'json'
    end
  end
  resources :realfacts
  resources :candlelightdinners

  get 'wantedidrsma', to: 'rsma#wantedid'
  get 'notwantedidrsma', to: 'rsma#notwantedid'
  get 'loveisland1', to: 'rsma#loveisland1'
  post 'loveisland2', to: 'rsma#loveisland2'
  get 'candlelight1', to: 'rsma#candlelight1'
  post 'candlelight2', to: 'rsma#candlelight2'
  post 'candlelight3', to: 'rsma#candlelight3'
  post 'candlelight4', to: 'rsma#candlelight4'
  post 'candlelight5', to: 'rsma#candlelight5'
  get 'rsmawrongtask1', to: 'rsma#wrongtask1'
  post 'rsmawrongperson1', to: 'rsma#wrongperson1'
  post 'rsmawrongtask2', to: 'rsma#wrongtask2'
  post 'rsmawrongperson2', to: 'rsma#wrongperson2'
  post 'rsmawrongpersontask', to: 'rsma#wrongpersontask'
  resources :people do 
    collection do
 get 'mysearch'
 post 'mysearch'
 get 'searchmypeople'
 get 'searchmystuff'
 get 'searchmycities'
 get 'searchmytasks'
 get 'searchmytaskactions'
 get 'searchmycountries'
 get 'searchmymusicinstruments'
 get 'searchmybacseries'
 get 'famousfriends'
 get 'newssailors'
 post 'keepsailors'
 get 'emoticons'
 get 'surnames'
 get 'peopleinterested'	
 get 'aliasesinterested'	
 get 'newspapers'	
 get 'whatclothing'	
            get 'sailorclothing1'
            post 'sailorclothing2'
            post 'sailorwhatclothing'
            get 'coloc1'
            post 'coloc2'
            post 'coloctask'
            post 'mytaskcoloc'
            get "peoplehavetasks"
            post "peoplehavethattasks"
      delete 'deleteasailorfromtask'

get 'sosies'
            get "compar1"
            get "dreamjobs"
            get "monblogaudio"
            get "monblogaudio"
            get "personjson"
            get "myalias2"
            get "mysurname", as: :loadpostsurname, action: :mysurname
            get "mytasks"
            get "mytask"
            get "mysailor"
            get "myattitude"
            get "mysurname2", as: :loadpostsurnames, action: :mysurname2
            get "mypics"
            get "datebirthjson"

            get 'villedeqn'
            get 'chercherlavilledeqn'


    end
    resources :cities do
      resources :epochs do
      collection do
            get 'whatepoch'
      end
      end
      collection do
            get 'lookforcity'
            get 'country'
            get 'state'
            get 'nationality'
      end
      member do
        patch 'myjobcity'
        get 'jobcity'

        post 'jobcity'
        post 'jobcitydelete'
        post 'jobcityconfirm'
      end
    end
    member do
get "seemytasks"
get "comparage"
get 'selfportrait'
get 'cars'

    get "seeastar"
    get "noterlapersonne"
get "webeauty", to: "people#webeauty"  


 get 'lifestaterequestpeople'
 get 'lifestatephotopeople'

      post 'cherchersaville'

      get "addlovers"
      get "editlovers"
      get "blog"
      get "newsurname"
      get "cestmoi"
      get "addprofilepic"
      get "defaultprofilepic"
      get "jingles"

      get "posts"
      get "aliasperson"
      post "aliasperson"
      get 'tasks' #ajouter des taches relatives à ces taches, ajouter des evenements à cette tache
      get 'events' #ajouter des taches à cet évènement , ajouter des evenements relatifs à cet evenement
      get "wikipedia"
      get "youtube"
      get "gmail"
      get "meetic"
      get "github"
      get "twitter"
      get "facebook"
      get "schedule"
      post "schedule"
    end
  end
  get 'tasksailorusedstuffs/addpeopleforwho'
  get 'tasksailorusedstuffs/forwho'
  get 'taskusedstuffs/addpeoplelikethis'
resources :seasons
resources :hotels do
collection do
get 'json'
end
end
resources :restaurants do
collection do
get 'json'
end
end

  get 'laundrycaptains/show'
  get 'laundry/:id', to: 'laundryjiramapeople#show'
get 'dormitory', to: 'madagascar#dormitory'
  post 'identifyrobot', to: 'mesjeux#identifyrobot', as: :identifyrobot
  get 'whoisrobot', to: 'mesjeux#whoisrobot', as: :mesjeux_quiestrobot
post 'trouverunrobot', to: 'mesjeux#trouverunrobot', as: :mesjeux_trouverunrobot
  get 'mesjeux/index'
  resources :tendances
resources :personstates do
member do
post 'myperson'
delete ':fd_id/:person_id', as: :del, action: :deleteperson
end
collection do



get 'personid'
get 'drinks'
get 'foods'
end
end
resources :categorythings do
resources :taskusedstuffs do
resources :tasksailorusedstuffs do
member do
get 'addpeopleforwho'
post 'forwho'
end
end
member do
get 'addpeoplelikethis'
post 'whouse'
end
end
member do

get 'qty'
post 'setqty'
post 'who'

end
collection do
get 'json'
get 'personid'
get 'taskid'


end
end
  get 'integrearmee',to: 'integre#armee', as: :integrearmee
  post 'grade',to: 'integre#grade', as: :armeegrade
  post 'clothesarmy',to: 'integre#clothesarmy', as: :armeeclothes
  post 'skillarmy',to: 'integre#skillarmy', as: :armeeskill
  post 'songarmy',to: 'integre#songarmy', as: :armeechanson
  post 'familyarmy',to: 'integre#familyarmy', as: :armeefamille
  delete 'deletegrade/:id',to: 'integre#deletegrade', as: :armeegradedelete
  delete 'deleteclothesarmy/:id',to: 'integre#deleteclothesarmy', as: :armeeclothesdelete
  delete 'deleteskillarmy/:id',to: 'integre#deleteskillarmy', as: :armeeskilldelete
  delete 'deletesongarmy/:id',to: 'integre#deletesongarmy', as: :armeechansondelete
  delete 'deletefamilyarmy/:id',to: 'integre#deletefamilyarmy', as: :armeefamilledelete
resources :photohavesailors
resources :foods do
collection do
get 'json'
end
end
resources :drinks do
collection do
get 'json'
end
end
resources :armygrades do
collection do
get 'json'
get 'myarmygrades'
post 'mysuperiorgrades'
get 'jeu'
post 'appellation'
post 'q2'
end
end
get 'jsongossips', to: 'aboutsomeonegossips#json', as: :json_gossips
resources :becausetasks do
collection do
get 'tickets'
get 'task'
get 'othertask'
end
end
resources :thistasknotthistasks do
collection do
get 'json'
get 'task'
get 'othertask'
end
end
resources :hernothers do
collection do
get 'json'
get 'person'
get 'otherperson'
end
end
resources :twopeoplemeets do
collection do
get 'person'
get 'otherperson'
end
end
resources :traits do
collection do
get 'json'
end
end
resources :attitudephotos do 
collection do
get 'person1'
get 'person2'
get 'traits'
get 'attitudes'
get 'senders'
get 'recipients'
get 'persontraits'
get 'personattitudes'

get 'addtrait'
get 'addtickets'
get 'addattitude'

end
end
resources :grades do
collection do
get 'json'
end
end
resources :stories do

resources :heroadventures
collection do
get 'heroadventures'
get 'adventures'
end
end

resources :heroadventures do
collection do
get 'json'
end
end
resources :torealizetasks do
collection do
get 'tasks'
get 'attitudes'
get 'addattitudes'
get 'addnewattitudes'
end
end

resources :instructions do
member do
get 'nextinstruction'
end
collection do
get 'aliases'
get 'next'
get 'json'
end
end
resources :radios do
collection do
 get 'json'
 get 'cities'
end
end
resources :airline_companies
resources :shaktistatements
resources :companieshaveceos do
collection do
get 'ceo'
get 'job'
get 'company'
get 'nationality'
end
member do
get 'addcustomers'
get 'addemployees'
end
end
resources :companieshavecustomers do
collection do
get 'employee'
get 'customer'
get 'company'
get 'nationality'
end
end
resources :companieshaveemployees do
collection do
get 'employee'
get 'employer'
get 'job'
get 'company'
get 'nationality'
end
end
resources :facebook_requests
resources :google_requests do
collection do
get 'json'
end
end
resources :googleresults
resources :peoplehavestrengths do
collection do
get 'linkspousepeople'
get 'strengths'
end
end
resources :peoplehaveweaknesses do
collection do
get 'linkspousepeople'
get 'weaknesses'
end
end
resources :strengths do
collection do
get 'json'
end
end
resources :weaknesses do
collection do
get 'json'
end
end
resources :bodyparts
resources :githubaccounts do
collection do
get 'json'
get 'person'
end
end
resources :githubrepos do
collection do
get 'json'
get 'places'
get 'githubaccounts'
get 'programminglanguages'
end
end
resources :githubaccounts
resources :olympicpeople do
collection do

get 'events'
get 'skills'
get 'people'
get 'otherpeople'
end

end
resources :skills do
collection do
get 'json'
get 'people'
end
end
resources :secretquestions do
member do
post 'guess'
end
end
resources :secretanswers
resources :selfies do 
collection do
  get 'people'
  get 'albumpeople'

  get 'albumemotions'

end
end
resources :musicalkeys do
collection do
get 'json'
end
end
resources :foyertasks do
collection do
get 'user2'
end
end
  post 'actionmenage', to: 'madagascar#actionmenage', as: :actionmenage
    get 'madagascar/changecuisinier', to: "madagascar#changecuisinier"
    get 'madagascar/changehommemenage', to: "madagascar#changehommemenage"
    get 'madagascar/membresfoyer', to: "madagascar#membresfoyer", as: :membresfoyer
    get 'madagascar/rolesmembres', to: "madagascar#rolesmembres"
    get 'madagascar/ordures', to: "madagascar#ordures"
    get 'madagascar/cuisinier', to: "madagascar#cuisinier"
    get 'madagascar/menage', to: "madagascar#menage"
    get 'madagascar/lemenage', to: "madagascar#lemenage"
    get 'madagascar/cuisine', to: "madagascar#cuisine"
  get 'jirama', to: 'cotisation#jirama'
  get 'cotisation', to: 'cotisation#index'
resources :repas
resources :transacs do
member do
get 'comporepas'
end
end
resources :menus
resources :depenses
resources :argent
resources :bacseries do
collection do
get 'json'
end
end
resources :admissionfiles do
collection do
get 'json'
end
end
resources :fields do
collection do
get 'json'
end
end
resources :sectors do
collection do
get 'json'
get 'field'
get 'city'
get 'admissionfiles'
get 'bacseries'
end
end
  post 'torolalana/add/:id', to: 'torolanana#add', as: :addtorolanana
  get 'torolalana/all', to: 'torolanana#allto', as: :alltorolanana
  get 'mytorolalana', to: 'torolanana#mytorolanana', as: :mytorolanana
  get 'mytorolalana/:id', to: 'torolanana#showmy', as: :showmytorolanana
  get 'torolalana', to: 'torolanana#index'
resources :betterpeople do
collection do
get 'people1'
get 'twopeople'
get 'people'
get 'otherpeople'
get 'attitudes'
end
end
resources :phrases do
collection do
get 'json'
end
end
resources :linguaramis do
collection do
get 'phrases'
end
end
resources :twopeople do
collection do
get 'person1'
post 'person2'
post 'comparetwo'
post 'comparetwopeople'
get 'json'
end
end
resources :scorecriteria do
collection do
get 'json'
end
end
resources :barcriteria do
collection do
get 'json'
end
end
resources :barreviews do
collection do
get 'barcriteria'
get 'scorecriteria'
end
end
resources :recordingreviews do
collection do
get 'barcriteria'
get 'scorecriteria'
end
end
resources :barattempts do
collection do
get 'person'
end
end
resources :linkspousepeople do
member do
post 'rel'
get 'womanman'
end
collection do
get 'otherlinkspousepeople'
get 'allpeopleincouple'
get 'json'
get 'tickets'
get 'links'
get 'people'
get 'otherpeople'
get 'forcefaiblesse'
post 'secondsailor'
post 'firstweakness'
post 'firstforce'
post 'forcefaiblessetruth'
get 'weaknessid'
get 'forceid'
end
end
resources :linkfamilypeople do
member do
get 'inverseorder'
get 'womanman'
get 'tickets'
end
collection do
get 'json'
get 'tickets'
get 'links'
get 'people'
get 'otherpeople'
get 'addsisterbrother'
get 'addcousin'

get 'thosepeople'
post 'sisterbrotherthosepeople'
post 'cousinthosepeople'

end
end
resources :spouselinks do
collection do
get 'json'
end
end
resources :familylinks do
collection do
get 'json'
end
end
resources :taskactions, path: 'actions' do
collection do
get 'sailors'
get 'json'
get 'thingstoknow'
end
end
resources :bars do
collection do
get 'keys'
get 'musicalinstruments'
end
end
resources :nationalities do
collection do
get 'json'
get 'people'
end
end
resources :schools do
member do
get 'voirlesphotos'
get 'notes'
get 'noterlycee'
post 'note'
post 'graduated'
post 'graduation'
end
collection do
get 'people'
get 'json'
end
end
resources :ustensiles
resources :artobjects
resources :schools
get 'suppravis/:id/:avis', to: 'mistralfm#socialnetwork', suppravistv: 'true', as: :suppravis
resources :questions do
collection do
get 'nbanswers'
get 'answers'
end
end
resources :answers
  get 'deleteentry', to: "mistralfm#socialnetwork", as: :deleteentry
  get 'mesinstruments/:id', to: "mistralfm#ustensiles", as: :mesustensiles
  get 'meslangages/:id', to: "mistralfm#langages", as: :meslangages
  get 'mesustensiles/:id', to: "mistralfm#instrument", as: :mesinstruments
  get 'alltheactors', to: "mistralfm#alltheactors"
  get 'allthepplhits', to: "mistralfm#alltheppl"
  get 'allthehits', to: "mistralfm#allthehits"
  get  'theits', to: "mistralfm#theits"
  get  'allactors', to: "mistralfm#allactors"
  get 'mistralfm/index'
  post 'dessinpost', to: 'dessiner#dessin', as: :creerpostdessin
  get 'dessiner/index', to: 'dessiner#index', as: :dessinerqch
  get 'dessinerpapier', to: 'dessiner#dessinerfeuille', as: :dessinerqchfeuille
post 'actiontasks/:id', to: 'tasks#actiontasks', as: :useractionswithtasks
  get 'lovedontlove/index'
post 'searchforattitudes',to: 'mypeople#seeattitudes', as: :searchforattitudes
post 'searchsurnames',to: 'mypeople#seesurnames', as: :searchsurname
post 'searchmytasks',to: 'mypeople#seetasks', as: :searchtask
post 'mypeople',to: 'mypeople#seeppl', as: :searchppl
post 'myposts',to: 'mypeople#seeposts', as: :searchposts
post 'myactor',to: 'mypeople#seeactor', as: :searchactor
post "opinion/:id", to: "mistralfm#socialnetwork", as: :opinion
patch "opinion/:id", to: "mistralfm#socialnetwork", as: :opinion2
resources :peoplerelations do
collection do
get 'json'
end
end
resources :worktwos do
collection do
get 'json'
get 'rel'
get 'tickets'
get 'personid'
get 'otherpersonid'
get 'worktwosjson'
end
end
resources :posts_surname_meanings do
collection do
get 'allps'
end
end
resources :surnames do
member do
get 'editpeople'
end
collection do
get 'websites'
get 'jsonwebsites'
get 'json'
get 'names'
get 'people'
get 'nationalities'
get 'schools'

end
end
resources :kgbtasks do
    collection do
      get 'people'

end
end
  get 'studenttasks/index'
  get 'studenttasks/show'
resources :studenttasks do
collection do
get 'people'
end
end
resources :hackertasks do
collection do
get 'people'
get 'tvseriesjson'
get 'tvseries'
end
end
  get 'mangatheque', to: 'mangatheque#index', as: :mangatheque
resources :tvseriesparodies do
collection do
get 'places'
get 'actors'
get 'json'
end
    member do
      get 'editroles'
    end

end
resources :filmparodies do
collection do
get 'places'
get 'actors'
get 'json'
end
    member do
      get 'editroles'
    end

end
resources :films do
collection do
get 'epochs'
get 'places'
get 'actors'
get 'json'
end
    member do
      get 'editroles'
    end

end
resources :lesson_languages
resources :lesson_titles
resources :lesson_recordings
resources :lesson_contents do
member do
get 'repeatafterpro'
end
end
resources :lesson_applications
resources :lesson_sentences

resources :lessons do
member do
get 'title'
get 'recordbook'
get 'languages'
get 'contents'
get 'samplecontents'
get 'words'
get 'recordings'
get 'samplerecordings'
end
end
resources :languages do
collection do
get 'people'
end
end
get 'route1', to: "tickets#route1"
get 'route2', to: "tickets#route2"
resources :answerinvites 
resources :invites do
collection do
get 'tasks'
get 'mymessage'
get 'people'
get 'peopleform'
end
end
  post 'psa', to: 'posts_surnames#psa', as: :mypsa
  post 'psb', to: 'posts_surnames#psb', as: :mypsb
  get 'mystops', to: 'posts_surnames#mysurnames', as: :mypssurnames
  get 'addaplacetosurnameattribute', to: 'posts_surnames#addaplacetops', as: :addaplacetosurnameattribute
  get 'selectaplacetosurnameattribute', to: 'posts_surnames#selectaplacetops', as: :selectaplacetosurnameattribute
  
  

  resources :compohaverecipients
  resources :artists do
    collection do
      get 'wannabes'
    end 
  end
  resources :musicalcompositions do
    collection do
      get 'songs'
      get 'json'
    end 
  end
  get "compo/:id", to: "musicalcompositions#show", as: :compo
  post '/posts_surnames/:id', to: "posts_surnames#update", as: :updateps
  post '/people/:id', to: "people#update"
  post '/places/:id', to: "places#update"
  post '/profilepictures/:id', to: "profilepictures#update"
  post 'signupcomposer/create'
  get 'signincomposer/destroy'
  get 'signincomposer/create'
  get 'signincomposer/new'
  get 'signupcomposer/new'
  get 'signupcomposer/edit'
  get 'signupcomposer/update'
  devise_for :composers, controllers: {registrations: 'signupcomposer', sessions: 'signincomposer' }
  resources :composers
  resources :islands do
        member do
      patch 'nouvelaidememoire'
        end
  end
  resources :robots
  resources :beaches do
        member do
      patch 'nouvelaidememoire'
      get 'newstreet'
        end
  end
  resources :create_beaches
  resources :aidememoires#, path: 'notes', controller: 'notes'
  post "mytick/:id", to: "tickets#myticket", as: :myticket
  get "tasksdecem", to: "tickets#tasks", as: :tasksdecesailor
  post "taskstoussailors", to: "tickets#taskstoussailors", as: :tasksdecessailors
  resources :tickets do
    collection do
      get 'linkspousepeople'
      get 'linkfamilypeople'
      get 'worktwos'
      get "json"
      get "cbrecipients"
      get "cbsenders"
      post "recipients"
      post "messagecontent"
      get "severalticketsandtasks"
      get "addmessage/:id", action: :addmessage, as: :addmessage

    end
    member do
      get "senders", action: :editsenders, as: :editsenders
      get "recipients", action: :editrecipients, as: :editrecipients
      get "messagecontent", action: :editmessagecontent, as: :editmessagecontent
      get "editalltasks"
      get "tasksforvalidation"
      get "tasksforunvalidation"
    end
  end
  resources :phrases_and_words
  resources :programminglanguages do
collection do
get 'peoplearecoders'
get 'people'
get 'json'
end
  end
  get "recordingsmycontent", to: "recordings#mycontent", as: :myownrecordingscontent
  get "recordingsmycontentbis", to: "recordings#mycontentbis", as: :myownrecordingscontentbis
  get "record/:typerecord", to: "recordings#myrecord"
  resources :musicalscores do
    member do
      post 'addbar'
    end
    collection do
      get 'json'
      get 'keys'
      get 'musicalinstrument'
      get 'myscores'
    end
  end
  resources :musicalinstruments do
    collection do
      post 'addnewplayer'
      post 'newplayer'
      get 'newplayer'
      get 'instrument1'
      get 'player1'
      get 'peoplearemusicians'
      get 'json'
      get 'players'
    end
  end
  resources :planets
  resources :addresses do
    collection do
      post 'create'
      get 'json'
      get 'myaddresses'
    end
  end
  
  get "chercherunmoussaillon",to:"people#chercherparnom"
  resources :jobs do
    collection do
      get 'things'
      get 'json'
      get 'people'
    end
  end
  resources :missions
  resources :emotions do
    collection do
      get 'json'
    end
  end
  resources :historical_characters
  resources :webpages
  resources :proposalvalidations
  resources :create_webpages
  get 'queensgambit', to: "queensgambit#index", as: :tqg
  get 'queensgambit/new'
  resources :twitteraccounts do
    collection do
      get 'json'
      get 'twitteraccounts'
      get 'searchintweets'
      get 'searchtweets'
    end
  end
  get 'news', to: 'news#index'
  post 'news', to: 'news#index'
  patch 'mysurnames/update'
  post 'mysurnames/update'
  get 'mysurnames/signout', as: :signoutsurname
  resources :mylayouts
resources :posts_layouts
  post "search", to: 'posts#searchposts', as: :searchpost
  get "search", to: 'posts#searchposts', as: :searchpostfirst
  get "search/page/:page", to: 'posts#searchposts', as: :searchpage
  #actions on posts
  get "addaword/(:id)", to: "posts#addaword", as: :addword
  get "addadish/(:id)", to: "posts#addadish", as: :adddish

  post "/postsnew", to: "posts#postsnew"
  get 'hackseveral/people', as: :hackseveral
  resources :jingles do 
collection do
get 'jinglesreactions'
get 'radios'
get 'json'
      get 'allmytasks'
get 'mypeople'
get 'radiopeople'
end
    member do
      get 'addsurname'
    end
  end
  resources :profilepictures do
    collection do
      get "mypics"
    end
    member do
      get "mysurname"
    end
  end
  resources :otherplaces
  resources :words
  resources :ideas
  resources :tvshows
  resources :philosophers
  resources :i18nphrases do
    collection do
      get 'otheri18nphrases'
      get 'aliases'
      get 'json'
      get 'people'
      get 'things'
      get 'places'
      get 'cities'
    end
  end
  resources :m17nphrases do
    collection do
      get 'people'
    end
  end
  resources :proposals do 
    member do
      post 'no'
      post 'cancel'
      get 'no'
      post 'yes'
      get 'yes'
    end
  end
  resources :tvseries do
    member do
      get 'addepisode'
      get 'editroles'
      get 'jsonactor'
            get "actor/:actor_id", as: :actor, action: :actor
        end

    collection do
      get 'epochs'
      get 'myfilmparodies'
      get 'mytvseriesparodies'
      get 'myfilms'
      get 'mytvseries'
      get 'secondlover'
      get 'firstlover'
      post 'saylovers'
      get 'lovers'
      get 'places'
      get 'json'
      post 'json'
      post 'acteurs'
      get 'jeudesacteurs'
      get 'actors'

    end
  end
  resources :reactions do
    collection do
      get 'json'
      get 'jsonreactions'
      get 'mypeople'
      get 'updatethisreaction'
    end
  end
  resources :brands
  resources :historicalevents
  resources :socialmovements do
    collection do
	get 'json'
    end
  end
  resources :sports do
    collection do
        get 'people'
    end
  end
  resources :plantspecies

  resources :albums do
    resources :photos
    member do


      get 'addphotos'
      get 'tagaperson'
      post 'tagsomeone'
    end
    collection do
      get 'mytaggedpeople'
      get 'mytaggedthings'
	get 'personjson'
	get 'person'
	get 'people'
    end
  end
  resources :companies do
  collection do
  get 'json'
  end
  end
  get "/statistics/medal/athlete", to: "people#olympicmedals", as: :athletemedals
  post "/statistics/medal/athlete", to: "people#olympicmedals", as: :searchathletemedals
  resources :countries do
    collection do
      get 'olympic/medals', as: :olympicmedals, action: :olympicmedals
      post 'olympic/medals', as: :searcholympicmedals, action: :olympicmedals
      post 'reponses'
      get 'jeu'
      get 'json'
    end
  end
  resources :dishes do
    collection do
      get "json"
      get "adddishnow"
    end
  end

  resources :states do
    collection do
      get "json"
    end
  end
  resources :fakecomments do
	member do 
		get 'courseapied', as: :courseapied
	end
  end
  resources :pronouns
  resources :endroits
  resources :emails
  resources :songs do 
    collection do
      get "hotels"
      get "radios"
      get "people"
      post "refreshsongradio"
      get "mypeople"
      get 'json'
      get 'addcouplet'
      get 'songid'
      post 'addonecouplet'
      get 'addrefrain'
      post 'addonerefrain'

    end
    member do
      get 'destroyconfirm'
      get 'destroyit'
      get 'composer'


    end
  end
  resources :couplets
  resources :refrains
  get "/persondisplay/:id", to: "posts#persondisplay"
  get "/thingdisplay/:id", to: "posts#thingdisplay"
  get "/eventdisplay/:id", to: "posts#eventdisplay"
  resources :routines, only: [:show,:update]
  resources :synonyms
  get 'displayusurpation', to: 'displayusurpation#index'
  resources :reactions_texts do
    collection do
      get 'cherchersurnames'
    end
  end
	
  resources :validations
  resources :scheduledtasks
  resources :event_types
  resources :attitudes do
    collection do
 	get 'jsonpeoplebuyclothes'
 	get 'peoplebuyclothes'
 	get 'jsonpeoplebuytraveltickets'
 	get 'peoplebuytraveltickets'
 	post 'myotherattitudes'
 	get 'chercherattitude'
 	post 'myattitudes'
 	post 'selectwoattitudes'
 	get 'selectwoattitudes'
 	get 'attitudejson'
 	get 'mysailors'
 	get 'myfollowers'
    end
  end
  resources :metonymies
  resources :things do
        collection do
            get "json"
            get "clearbasket"

    end
    member do
            get "mysurname"
            get "removebasket"
      get "addbasket"

    end

  end
  post 'addsomethingyoudidonce', to: "people#addsomethingyoudidonce"
  get '/didonce/:id', to: "people#didonce"
  
  get '/:user/:title-3083373c1185', to: 'articles#showarticle', as: :showarticle
  resources :articles do
    member do
      get 'showarticle/:title', action: 'showarticle', as: :showarticle_article
    end
  end

  resources :tweets do 
    collection do
      get "indextweetrails", action: "indextweetrails", as: "indextweetrails"
      get 'unauthorized'
      post 'newtweet'
      get 'myfeeds', action: :myfeeds, as: :myfeeds
    end
    member do
      get "showtweetrails"

    end

  end
  resources :posts_surnames do
    collection do
            get 'json'
            get 'otherpostssurnames'
            get 'allps'
            get 'ps1'
            get 'ps2'


            get 'mypeople'
            get 'names'
            get 'namesdestinataire'
            get 'myavatars'
            get 'mystuff'
            get 'mypics'

    end
    member do
            patch 'nouvelaidememoire'

            get 'posts'
            get 'editerceluila'
    end
  end
  resources :savedtweets
  get 'searchpost', to: 'posts#searchpost'
  post 'searchpost', to: 'posts#searchpost'
  resources :reactions
  resources :facts
  resources :places do
collection do
get 'json'
end
member do
get 'mysurname'
end
  end
  resources :cars do
    resources :peoplecars do
    end
    collection do
      get 'json'
    end
  end
  resources :post_types
  resources :comicbooks
  resources :clothes do
    collection do
      get 'aliases'
    end
  end
  resources :moviescenes
resources :laundryjiramapeople do
collection do
get 'json'
get 'person2'
get 'grade2'
get 'person1'
get 'grade1'
post 'inversesalut/:id', as: :inversesalut, action: :inversesalut
post 'monsalutmilitaire'
get 'salutmilitaire'
end
resources :laundrycaptains
member do
post 'capitaine'
end

end
  resources :epochs do
  resources :cities do
    member do
      get 'addpeoplecity'
      post 'addthosepeoplecity'
    end
  end
    resources :grades do
      resources :people do
        resources :users do
          resources :armygrades do
resources :laundryjiramapeople do
collection do
get 'jsonjirama'
get 'jiramapeople'
end
end
      collection do
        get 'mysectors'
        get 'myjobs'
        get 'usurpate'
        post 'usurpatewithgrade'
      end
          end
        end
      collection do
        get 'addstudents'
        post 'addstudentsroute'
      end
      end
    end
    collection do
      get 'factoriesservicehaveemployeesjson'
      get 'factoriesservicehaveemployees'
      get 'peoplehavejobs'
      get 'peoplehavejobsjson'
      get 'json'
      get 'student'
      get 'grade'
      get 'person'
    end
  end
  resources :musicalbums
  post "allmypostssurnames", to: "posts_surnames#renderone", as: :rendermypostssurnames
  resources :videos
  resources :photos do
member do
      get 'belongto/:thingid',as: :belongto, action: :belongto
get 'belongings'
get 'tagathing'
post 'tagsomething'
get 'tagaperson'
post 'tagsomeone'
end
 collection do
  get 'json'
  get 'things'
  get 'people'
  get 'albumpeople'

  get 'albumemotions'
 end
  end
  get 'notes', to: "recordings#notes"
  resources :recordings do 
    collection do
      get 'json'
      get 'phraseandword'
      get 'wordandphrase'
      get 'onlyphrase'
      get "onlyword"
    end
  end
  resources :events do
    collection do
      get "json"
    end
  end
root :to => "welome#user"

  resources :contents
  resources :comments
  resources :fromsomeonegossips
  post '/aboutsomeonegossips/:id', to: "aboutsomeonegossips#show"
  resources :aboutsomeonegossips do
    collection do
      get "tvseries"
      get "aboutthem"
      get "reactionid"
      get "before"
      get "during"
      get "after"
    end
  end

  post 'actualiserlalistedespersonnes', to: "people#actualiserlalistedespersonnes"
  resources :photos do
    member do 
      get 'facebook'
      post 'facebook'
    end
  end
  post "/welome", to: "welome#index"
  post "submitmypost", to: "posts#submitmypost"
  #post "updateuser/:id/modify", to:"updateuser#modify", as: :user, via: [:get,:post]
  resources :posts do 
resources :mymaps do
resources :mymapscoords
member do


get 'addaplace'
get 'searchaplace'
post 'addaplace'
post 'placeadded'
end
end


collection do
get 'guessaswho'
get 'reactiontrueanswer/:reactiontrueimage_id/person/:person_id', action: :reactiontrueanswer,as: :reactiontrueanswer
post 'reactiontrueanswer/:reactiontrueimage_id/person/:person_id/myanswer', action: :myreactiontrueanswer,as: :myreactiontrueanswer
post 'rightorwrongposts'
post 'personsaysthat'
get 'emoticonid'
get 'myposts'
post 'choosetrueid'
get 'choosesailorpost1'
get 'json'
get 'postrange'
post 'postrangeposts'
get 'placeid'

get 'mysongs'
get 'hackedpeople'
get 'hernother'
get 'thistasknotthistask'
get 'i18nphrases'
  get 'collectionstasks', to: 'posts#collectionstasks', as: :collectionstasks

      get 'socialmvmt'
      get 'createnewthread'

      post 'newpostwithcollections'
      get 'newpostwithcollections'
      post 'jingles'
      get 'jingles'
      post 'myavatars'
      post 'mypeople'
      get 'allmytasks'
      post 'myownpeople'
      post 'myfrequentpeople'
      post 'mycollectionsofpeople'
      post 'mondestinataire'
      get "yourlayout/:layouttype", action: :yourlayoutpost, as: :yourlayoutpeopleyeah
      post "yourlayout/:layouttype", action: :yourlayoutpost, as: :yourlayoutpeople

end
    member do 
      delete 'delps/:psid', :as => :deletesurname, action: :deletesurname
      get 'addaposttype'

            get 'addamap'
            get 'addasongtothispost'
            get 'mestachesdehacker'
            get 'socialmovements'
            get 'myjingles'
      get 'addnewaddress'
      get 'tweets'
      get 'editavatars'
      get 'addwebpages'
      get 'addnewavatars'
      get 'specialoptions'
      patch 'myproposals'
      post 'myproposals'
      get 'mesicones'
      get 'myproposals'
      get 'photosorfilms'
      get 'myepochs'
      get 'mymoviescenes'
      get 'mycomicbooks'
      get 'myhistoricalcharacters'
      get 'reproduire'

      get 'addcompany'
      get 'addwebpage'
      get 'addmovie'
      get 'currentprofilepic'
      get 'facebookreq'
      get 'addcontent'

      get "mylayout/:layouttype", action: :mylayoutpost, as: :mylayoutpost
      get "mylayoutfrontpage(/:layouttype)", action: :mylayoutfrontpage, as: :mylayoutfrontpage
      get 'linkreaction'
      get 'attitude'
      get 'tasksposts'
      get 'messagescaches'
      get 'words'
      get 'synonyms'
      get 'fakecomments'
      get 'metonymies'
      get 'anaphorsposts'
      get 'googlereq'
      get 'postsplaces'
      get 'addtvseries'
      get 'addnewjingles'
      get 'addtendances'
      get 'adddishes'
      get 'postexpired'
      get 'emailsforposts'
      get 'postsjingles'
      get 'avatars'
      get 'character'
      get 'newtendances'
      get 'newjingles'
      get 'repliquefilm'
      get 'allsailors'
      get 'usurpation'
      get 'tasks'
      get 'surnames'
      get 'surnames/:idsurname/usurpation', action: :usurp, as: :usurp
      get 'thread'
      get 'facts'
      get 'tasks_sailors/:id', action: :anaphors, as: :anaphors
    end
  end
      get "/posts/:id/mylayout/:layouttype", action: :mylayoutpost, controller: :posts, as: :mylayoutpost

  get '/posts/page/:page',to:'posts#index', as: :allpostspage
  resources :techniques do
    member do
      get 'formdelete'
      get 'deletereally'
    end
  end
  resources :technologies do
member do
post "becomes"
end
  end
  resources :arguments
  post '/posts/new',to:'posts#new'
  post '/posts/:id/edit',to:'posts#edit'
  patch '/posts/:id/edit',to:'posts#edit'
  get '/addasynonym',to:'posts#addasynonym'
  get '/addametonymy',to:'posts#addametonymy'
  post '/posts/:id/edit',to:'posts#edit'
  get "/editoptions", to: "updateuser#options"
get 'voyageuranonyme', to: 'updateuser#voyageuranonyme'
post 'whoid', to: 'updateuser#whoid'
post 'selectcityroom', to: 'updateuser#selectcityroom'
post 'cherchelogementresto', to: 'updateuser#cherchelogementresto'
post 'reserver', to: 'updateuser#reserver'
post 'mareservation', to: 'updateuser#mareservation'
get 'cityidupdateuser', to: 'updateuser#cityid'
get 'mybookings', to: 'updateuser#mybookings'

  post "/editoptions", to: "updateuser#options"
  get "/newperson", to: "updateuser#createpers"
  get "/renderapost/:id", to: "posts#renderapost"
  post "/renderanemail", to: "posts#renderanemail"
  post "/hacksomeone/:id", to: "posts_surnames#hacksomeone"
  post "/renderoneemail/:id", to: "posts#renderoneemail"
  post "/deleteallthoseposts", to: "posts#deleteallthoseposts"
  get "/renderaperson/:id", to: "posts#renderaperson"
  post "/renderareaction/:id", to: "posts#renderareaction"
  post "/renderareactionwithoutid", to: "posts#renderareactionwithoutid"
  post "/renderapostirl", to: "posts#renderapostinrealtime"
  get "/renderatask/:id", to: "posts#renderatask"
  post "/newperson", to: "updateuser#createpers"
  post "/renderallthethings/:id", to: "posts#renderallthethings"
  post "/talkaboutthis/:id", to: "posts#talkaboutthis"

  devise_for :users

 resources :users, only: [:show] do
resources :people
 end
 
  resources :events do 
        collection do
            get "clearbasket"

    end
    member do
            get "removebasket"
      get "addbasket"
      get 'tasks'
    end
  end

  devise_for :posts_surnames, controllers: { sessions: 'mysurnames' }
  get "/setoftasks/:setoftask_id/tasks/:id/edit", to: "tasks#edit", as: :edit_setoftask_task
  get "/setoftasks/:setoftask_id/tasks/:id", to: "tasks#show", as: :setoftask_task

  resources :tasks do 
    
    collection do
      get 'songs'
      post 'myjobsailorbis'
      post 'myjobsailor'
      get 'followingtasks'
      get 'accomplishsailors'
      get 'sailoraccomplishment'
      get 'taskaccomplishment'
      get 'accomplishmyduty'
      get 'films'
      get 'tvseries'
      get 'conditionnotneglectedtasks'
      post 'conditionnotneglectedtasks2'
      post 'conditionnotneglectedtasks3'
      post 'conditionnotneglectedtasks4'
      post 'conditionnotneglectedtasks5'

      get 'conditionwelldonetasks'
      post 'conditionwelldonetasks2'
      post 'conditionwelldonetasks3'
      get 'thingid'					      

      get 'starattitude'


      get 'googlerequest'
      get 'justeca'

      post 'sailorjobticket'
      post 'searchsailorjobticket'
      post 'searchsailorticket'
      get 'searchtaskticket'
      post 'accomplishataskbefore/:taskhavetaskactiontwosailorjob_id/precededbytask', action: :taskhavetaskactiontwosailorjobprevious, as: :taskhavetaskactiontwosailorjobprevious

      get 'accomplishataskbefore/:taskhavetaskactiontwosailorjob_id', action: :taskhavetaskactiontwosailorjob, as: :taskhavetaskactiontwosailorjob
      post 'taskactionsailorjob/:taskaction_id/:sailorjob_id/:taskactionsailorjob_id/addsailor', action: :taskactionsailorjobaddsailor, as: :taskactionsailorjobaddsailor
      get 'taskactionsailorjob/:taskaction_id/:sailorjob_id', action: :taskactionsailorjob, as: :taskactionsailorjob
      get 'taskactionidd'

      post 'selecttaskactionsailorjob'
      post 'selectsailortaskaction'
      get 'addtaskactiontosailorfortask'
      post 'twosailors'
      post 'secondsailor'
      post 'firstsailor'
      post 'secondtask'
      get 'comparesailors'
      get 'sailorsofthistask'
      post 'sailorsofthistask'
      get 'chosesailortask'
      get 'newwithaidememoire'
      get 'failingtickets'
      get 'tickets'
      get 'drinks'
get 'epochs'
get 'gossips'
      get 'things'

      get 'githubrepos'
      get 'city'
      get 'json'
      get 'myactions'
      get 'attitudesailors'
      get 'worktwo'
      get 'attitudes'
      get 'myrelatedtasks'
      get 'people'
      get 'setoftasks'

      get 'allmytasks'
      get 'showcollections'
      delete 'deleteasailor'
      delete 'deleteasailorimage'
      get 'places'
      get 'recordings'

    end
    member do
      get 'addtypetask'
      post 'addmytypetask'
      get 'notesailorstasks'
      get 'getwinning'

      get "starattitude"
      get "winningattitude"
      post 'grouptasksailors/:grouptask_id/:person_id/addsailor', action: 'grouptasksailoraddsailor', as: :grouptasksailoraddsailor
      post 'grouptasksailors/:grouptask_id/:person_id/addaction', action: 'grouptasksailoraddaction', as: :grouptasksailoraddaction
      post 'grouptasksailors/:grouptask_id/:person_id/addthing', action: 'grouptasksailoraddthing', as: :grouptasksailoraddthing
      get 'grouptaskaddsailors/:grouptask_id/:person_id', action: 'grouptaskseesailor', as: :grouptaskseesailor

      post 'grouptasksailors/:grouptask_id', action: 'grouptasksailors', as: :grouptasksailors
      get 'grouptaskaddsailors/:grouptask_id', action: 'grouptaskaddsailors', as: :grouptaskaddsailors
      get 'grouptask/:grouptask_id', action: 'grouptask', as: :grouptask
      get 'newgrouptask'
      get 'editgrouptask'


      get "attitudestask"
      get "goodidea"
      get "badidea"
      get "note"
      get "noterealizedtask"
      get "risk"
      get "saved"
      patch 'nouvelaidememoire'
      get 'addsenders'
      get 'addrecipients'

      get 'iaccomplishedthistask'
      get 'confirmdelete'
      get 'deletetask'

      get 'messageforyou'
      get 'events'
      get 'showplaces'
      get 'gossips'
      get 'nearbyplaces'
      get 'successticket'
      get 'failureticket'
    end
  end

  #devise_scope :user do
  ##    get '/users/sign_out' => 'devise/sessions#destroy'
  #    get '/users/sign_in' => 'devise/sessions#new'
  #end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
