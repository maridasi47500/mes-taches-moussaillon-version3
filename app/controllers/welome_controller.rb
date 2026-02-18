require 'assets/photos'

class WelomeController < ApplicationController
    protect_from_forgery except: [:index,:q]
def q
x=Rails.application.routes.recognize_path(params[:url])
render partial: "application/mydoc2", locals:{controller:x["controller"],action:x["action"]}, layout:false
end
def user
if user_signed_in?
redirect_to posts_path
else
render layout: "inscription"
end
end
def index
	@get_info = params[:pseudo] && params[:info]
	if @get_info
    p=Photos.new
          @afficher = p.getphotos
          p "afficher"
          p @afficher
        elsif @rechargerphotos
          @newphotos = Photo.new
        end
    respond_to do |format|
      format.html { render }
      format.js { render }
    end

	#1 = nom vue
	#je pense que pour ne pas ue passer son temps sur des sites de dev devienne une malade, il faut reussira concilier la technologie de dev avec la realite (par exemle si je reussis a importer quelquesphotos dans le projet pour raconter ma vie, c'st bien)
	# en meme temps c'est difficile de pas avoir toutes les technos
	# en main opur pouvoir se connecer sur 10 trucs en meme temps
	# on se fait nicker sur le front end qu'on choiit pas
	# et on est oblige d'utiliser des gems pour etre ala drniere pointe
	#des nvelles donnees sur un grand site
	#mais avecla gem on se fait nicker
	#cr on pourrat psser par des gits deja fait au niveau de la reproduction
	#du back end des sites=ce qui revient a utiliser des gems
	#mais ca me saoule
	#c'est pas sur que je reussisse a faire un hackng sophistique 
	#ais je veux developper des moyens dintegargir avec e contenu en ligne
#
#
	#comme pour le projet 5 
	#peut importe les donnees chargees

	#COMMENTS

	#alexa peut se connecter avec mes applications
	#pouvoir jouer des threads
	#je peux faire ou jouer plusieurs jingles
	#ca peut etre complique a faire 
	#pouvoir interagir sur une ouvelle propriete comme pour la mission du service civique
	#
	#il faut pouvoir avoir une connection sur des feeds exterieurs et pouvoir en faire des posts sur une base perso
	#ais apres il faut pouvoir developper sa propre base: et pouvoir charger pein de choses pas que du texte comme ca, mais 	

	#airbnb il a ca seulement pour la photo quon peut prendre u lapart 	
	#il faut le connecter a alexa
#hacker
	#le plu pratique c'est de developper une bse qui n'est pas locale et de pouvor changer l'interface autnt de foi en instalant des choses sur l'appliation locale qu'on peut connecter
	#comme par exemple une base heroku et des comptes de serveur d'image 

	#https://developers.facebook.com/tools/explorer
	#je suis deja allee sur 
	#sur twitter on peut hacker d'autres utilisateur
	#apres pour trouver tousles services meme sevie google c'est possible, 
	
	#apres pour trouver tousles services meme sevie google c'est possible, 
	#je vois quel est le front end mais le bck end
	#je peux pas le back end c'est difficile de le recuperer	
	#et selon leype de post tupeux ajouter des jingles avec alexa super simplement
	#mais c;ets ooas tout il fut connecter mon application

	 		

	
    #je pourrais
    #ajouter à mon programme des champs de pieces jointes
    #gerer les inputs
    #ensuite il faudrait personnaliser le front end (et pourquoi pas le front end alexa)
    #et après il faudrait 
    #et après il faut développer le hackage de fb et twitter
    #https://www.facebook.com/photo.php?fbid=862654447206968&set=a.748333528639061&type=3
    #https://scontent-cdg2-1.xx.fbcdn.net/v/t1.0-9/18011090_862654447206968_419807870697819763_n.jpg?_nc_cat=100&ccb=2&_nc_sid=174925&_nc_ohc=UfuNs8zKyUkAX-G42lx&_nc_ht=scontent-cdg2-1.xx&oh=3fa5f0b814430a1de161dede2d97a7fe&oe=5FC17DBD
	
		
	end
end
