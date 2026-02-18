class Depense < ApplicationRecord
self.table_name='Depense'
belongs_to :transac, foreign_key: 'transaction_id', class_name:'Transac'

belongs_to :user
before_validation :savetransac
#after_initialize :setdate
def username
user ? user.name : ""
end

def setdate
self.date=DateTime.now.localtime
end
def savetransac
self.transac = Transac.create(user_id: self.user_id, somme: -self.somme,motif:'Depense')
end

end
