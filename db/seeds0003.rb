post=Post.find_or_create_by(content:'qui est flrian et pourquoi il dit que je suis comme un chien qui lui saute dessus quand il est content')
post.post_types << PostType.find_by(name:'LinkArticle')
post=Post.find_or_create_by(content:'qui est leandre et pourquoi il dit que il joue le jeu avec landry')
post.post_types << PostType.find_by(name:'LinkArticle')
post=Post.find_or_create_by(content:'qui est leandre et pourquoi il cherche n\'importe quel pretexte pour que je sois lesbienne avec n\'importe qui')

