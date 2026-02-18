class Foyertask < ApplicationRecord
belongs_to :firstuser, foreign_key: 'user1', class_name: 'User'
belongs_to :seconduser, foreign_key: 'user2', class_name: 'User'
attr_accessor :nomtache, :nomtachepasse, :image
before_validation :throwerror

def throwerror
myuser=User.where('(cuisinier = ? or ordures = ?) and id = ?',self.user1, self.user1,self.user2)


if self.user1 && self.user2 && !myuser[0]



    self.errors.add(:base, "#{self.seconduser.name} n'est pas disponible ou il/elle ne vous a pas choisi(e) pour #{self.nomtache}. Veuillez consulter les clients du foyer.")

end
end
end
