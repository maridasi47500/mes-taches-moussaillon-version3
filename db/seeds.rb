swim=Sport.find_by(name_fr: "natation")

sport=SportGroup.find_or_create_by(name_fr: "Aquatics",name_en: "Aquatics",code: "AQ")
olsport=Olympicsport.new
olsport.sport_group= sport
olsport.sport=swim
olsport.code='SWM'
olsport.save
#Country.create(code: "DMA", name: "Dominica")
#Country.create(code: "DMA", name: "Dominica")

#Country.find_or_create_by(name_en: "East Germany",code: "GDR")
#Country.find_or_create_by(name_en: "West Germany",code: "FRG")
#Country.find_or_create_by(name_en: "Soviet Union",code: "URS")

#
#realfact=Realfact.create(content_fr: "clara et cleo elles essaient de se rencontrer")
#post=Post.find_or_create_by(content:'qui est nathan et pourquoi c\'est mon fiance')
#post.post_types << PostType.find_by(name:'LinkArticle')
#post=Post.find_or_create_by(content:'qui est luca et pourquoi quand je vais à son anniversaire je suis lesbienne')
#post.post_types << PostType.find_by(name:'LinkArticle')
#post=Post.find_or_create_by(content:'qui est luca et pourquoi quand je le connais je suis lesbienne')
#post.post_types << PostType.find_by(name:'LinkArticle')
#post=Post.find_or_create_by(content:'qui est leandre et pourquoi il me dit que quand je vis chez moi je dois aller à la crau')
#post.post_types << PostType.find_by(name:'LinkArticle')
#post=Post.find_or_create_by(content:'qui est rodolphe et pourquoi theo il me dit que je dois redevenir comme quand on été allés voir le monde de narnia')
#post.post_types << PostType.find_by(name:'LinkArticle')
#post=Post.find_or_create_by(content:'qu\'est-ce que c\'est le permis de conduire et les publicites pour le permis de conduire et pourquoi c\'est de la chiotte')
#post.post_types << PostType.find_by(name:'LinkArticle')
#post=Post.find_or_create_by(content:'pourquoi leandre il veut que je m\'allonge et que clara ele enleve son soutien-gorge mais il veut pas que je fasse de l\'informatique')
#post.post_types << PostType.find_by(name:'LinkArticle')
#post=Post.find_or_create_by(content:'qu\'est-ce que c\'est les publicites pour ruby on rails et pourquoi c\'est de la chiotte')
#post.post_types << PostType.find_by(name:'LinkArticle')
#    @accounts = [["nathan chan","nathanchancello"],["clara chan","jclarachan"],["clément bénech","clementbenech"],["harry styles","Harry_Styles"]]
#Twitteraccount.create!(@accounts.map {|x| {name: x[0].titleize, username: x[1]}})
#Relation.destroy_all
#Relation.create!(name_en: "now", name_fr: "maintenant")
#Relation.create!(name_en: "then", name_fr: "puis")
#Relation.create!(name_en: "so", name_fr: "donc")
#Relation.create!(name_en: "but", name_fr: "mais")
#Relation.create!(name_en: "because", name_fr: "car")
#Relation.create!(name_en: "first", name_fr: "d'abord")
#Relation.create!(name_en: "as a reminder", name_fr: "pour rappel")
#Relation.create!(name_en: "not to do", name_fr: "pour ne pas faire")
#Relation.create!(name_en: "and not", name_fr: "et pas")
#Relation.create!(name_en: "no", name_fr: "non")
#Relation.create!(name_en: "and", name_fr: "et")
#Relation.create!(name_en: "or", name_fr: "ou")
#Relation.create!(name_en: "or then", name_fr: "ou alors")
#Relation.create!(name_en: "that", name_fr: "que")
#Relation.create!(name_en: "when", name_fr: "quand")
#Relation.create!(name_en: "if", name_fr: "si")

