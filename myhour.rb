nathan=Person.find(17)
utc_time = Time.now.utc
clara=Person.find(18)
marie=Person.find(10)
alice=Person.find(28)
ps=PostsSurname.new(person:clara, surname:Surname.new(name:'clara'))
post=Post.new(content_fr:"je suis a los angeles il est #{utc_time.in_time_zone('America/Los_Angeles')}")
post.my_posts_surnames << ps
post.save
ps=PostsSurname.new(person:nathan, surname:Surname.new(name:'nathan'))
post=Post.new(content_fr:"je suis a seattle il est #{utc_time.in_time_zone('America/Los_Angeles')}")
post.my_posts_surnames << ps
post.save
ps=PostsSurname.new(person:marie, surname:Surname.new(name:'mar'))
post=Post.new(content_fr:"je suis a paris il est #{utc_time.in_time_zone("Europe/Paris")}")
post.my_posts_surnames << ps
post.save
ps=PostsSurname.new(person:alice, surname:Surname.new(name:'alice'))
post=Post.new(content_fr:"je suis a paris il est #{utc_time.in_time_zone("Europe/Paris")}")
post.my_posts_surnames << ps
post.save
