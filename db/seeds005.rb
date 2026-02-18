post=Post.find_or_create_by(content:'qui sont les hommes du tournage du queens gambit et opurquoi ils veulent prendre le train avec moi quand je vais à la gendarmerie')
post.post_types << PostType.find_by(name:'LinkArticle')
post=Post.find_or_create_by(content:'qui est virginie pape et pourquoi theo ou sylvain ilb veut que en mai elle fasse quelque chose que je veux pas qu\'elle fasse')
post.post_types << PostType.find_by(name:'LinkArticle')
post=Post.find_or_create_by(content:'qui est sylvain et pourquoi alice on fait que comme si on essaye les choses sur elles et pour moi on reussit les choses sur moi')
post.post_types << PostType.find_by(name:'LinkArticle')

post=Post.find_or_create_by(content:'qui est natacha et pourquoi tant qu\'elle appelle nicolas colas et elle lui dit colas t\'es trop sympa je vais pas pouvoir me penser normalement')
post.post_types << PostType.find_by(name:'LinkArticle')
post=Post.find_or_create_by(content:'qui est leandre et pourquoi il veut me consoler')
post.post_types << PostType.find_by(name:'LinkArticle')
post=Post.find_or_create_by(content:'qui est leandre et pourquoi il veut nous rencontrer au ski')
post.post_types << PostType.find_by(name:'LinkArticle')
post=Post.find_or_create_by(content:'je suis ne a munster')
person=Person.where('lower(name) like ?','%louna espinosa%').first
post=Post.find_or_create_by(content:'tu réussis pas bien')
post.hackedpeople << person

person=Person.where('lower(name) like ?','%charlotte levy%').first
post=Post.find_or_create_by(content:'tu réussis pas bien non plus')
post.hackedpeople << person

person=Person.where('lower(name) like ?','%mickael abiteboul%').first
person.todojobs << Task.find_or_create_by(name:'toucher cheveux')
person=Person.where('lower(name) like ?','%daniel radcliffe%').first
person.todojobs << Task.find_or_create_by(name:'lui dire que j\'ai vu son film à ctgu')
person=Person.where('lower(name) like ?','%lang%').first
post=Post.find_or_create_by(content:'safe sex')
post.hackedpeople << person
person=Person.where('lower(name) like ?','%harry styles%').first
post=Post.find_or_create_by(content:'wtf??')
post.hackedpeople << person
post=Post.find_or_create_by(content:'c\'est quoi le jeu du renard et pourquoi on doit jouer a ce jeu')
post.post_types << PostType.find_by(name:'LinkArticle')
post=Post.find_or_create_by(content:'qui estnathan et pourquoi je dois me marier avec lui')
post.post_types << PostType.find_by(name:'LinkArticle')
post=Post.find_or_create_by(content:'qui est lang lang et pourquoi j\'ai vu une affiche de lui de 6 m sur 6 m de lui à l\'aeroport de canton et nathan s\'est photographie avec lui')
post.post_types << PostType.find_by(name:'LinkArticle')
post=Post.find_or_create_by(content:'qui estnathan et pourquoi c\'est mon fiance')
post.post_types << PostType.find_by(name:'LinkArticle')
post=Post.find_or_create_by(content:'qui est luca et pourquoi quand je vais à son anniversaire je suis lesbienne')
post.post_types << PostType.find_by(name:'LinkArticle')
post=Post.find_or_create_by(content:'qui est luca et pourquoi quand je le connais je suis lesbienne')
post.post_types << PostType.find_by(name:'LinkArticle')
post=Post.find_or_create_by(content:'qui est landryet pourquoi il pourrait connaitre qui sont mes cheris')
post.post_types << PostType.find_by(name:'LinkArticle')
post=Post.find_or_create_by(content:'qui est virginie pape et pourquoi tout ceque je fais a la tele theo veut lui montrer et je dois continuer de la voir')
post.post_types << PostType.find_by(name:'LinkArticle')
post=Post.find_or_create_by(content:'qui est leandre et pourquoi il espionne mes moindres faits et gestespour me dire avec qui jesuis enervee')
post.post_types << PostType.find_by(name:'LinkArticle')
post=Post.find_or_create_by(content:'qui est leandre et pourquoi a chaque fois que je fais un truc sur l\'ordinateur il le casse en disant que je vais etre lesbienne')
post.post_types << PostType.find_by(name:'LinkArticle')
post=Post.find_or_create_by(content:'qui est nathan et pourquoi lui aussi il va avoir beaucoup de cadeaux')
post.post_types << PostType.find_by(name:'LinkArticle')
