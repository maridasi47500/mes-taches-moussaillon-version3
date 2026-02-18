# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Jingle.destroy_all
Recording.destroy_all
Video.destroy_all
Person.destroy_all
User.destroy_all
Post.destroy_all
Double.destroy_all
Author.destroy_all
Recipient.destroy_all
people=Person.create([{name: 'landry manankoraisina',image: 'landrymananko.jpg'},{name: 'diego du crl',image: 'diego_crl.jpg'},{name: 'gens du crl',image: 'crl.jpg'},{name:'lewis capaldi',image:'lc.jpeg'},{name:'harry styles',image:'hs.jpeg'},{name:'zakaria',image:'zakaria.jpeg'},{name:'ivan',image:'canope.jpeg'}])
me = User.create(name:'mary',image:'m.jpg', email:'mar@email',password: 'xxxxxx',password_confirmation: 'xxxxxx')

post=Post.create(content: 'je suis le plus beau')
post.authors << me
post.usurpations << Person.where(name: 'harry styles')
post.destinataires << Person.where('name like ?','lewis%') 
zak=Person.find_by(name: 'zakaria')
zak.relatedtasks << Task.create(name: 'reparer carrosserie')
landry=Person.where('name like ?', 'landry%').first
landry.relatedtasks << Task.create(name: 'hack me')



