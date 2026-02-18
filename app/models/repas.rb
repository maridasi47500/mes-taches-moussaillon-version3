class Repas < ApplicationRecord
self.table_name = 'Repas'
belongs_to :user
belongs_to :transac, foreign_key: 'transaction_id', class_name:'Transac', optional: true
attr_accessor :menuids
before_validation :savetransac
after_initialize :setdate
has_many :menuhaverepas
has_many :menus, through: :menuhaverepas
def username
user ? user.name : ""
end

def setdate
self.date=DateTime.now.localtime

end
def savetransac
mesmenus=Menu.where(id: self.menuids)
self.somme=mesmenus.pluck(:prix).sum
self.menus=mesmenus
self.transac = Transac.create(user_id: self.user_id, somme: -self.somme,motif:'Repas')

end
end
