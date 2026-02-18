class Reactiontrueimage < ApplicationRecord
attr_accessor :test, :myperson
belongs_to :reactionpic, class_name: 'Emoticon'
belongs_to :user
belongs_to :post
belongs_to :posts_surname
validates_uniqueness_of :user_id, scope: [:post_id, :posts_surname_id]
before_validation :mytest
def mytest
if test
k=Emoticon.find(self.test)
if k != self.reactionpic
h=self.post.reactiontrueimages.where.not(id: self.id).sample
if h
untel=h.posts_surname.nomdecettepersonne
self.myperson=h.posts_surname
ceschoses=h.post.content
        self.errors.add(:base, "Erreur!! Indice : est-ce que #{untel} a dit #{ceschoses}")
end

end
end
end
def self.icons(a,b)
where(post_id: a, posts_surname_id: b)
end
def self.findemoticon(post_id,mypost_id,emot_id)
p post_id, mypost_id, emot_id
find_by(post_id: mypost_id, posts_surname_id: post_id,reactionpic: emot_id)
end
end
