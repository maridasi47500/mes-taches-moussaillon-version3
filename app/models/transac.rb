class Transac < ApplicationRecord
self.table_name = 'Transaction'
belongs_to :user

before_validation :adddate
has_one :depense, foreign_key: 'transaction_id', class_name: 'Depense'
has_one :repas, foreign_key: 'transaction_id', class_name: 'Repas'
def mescomptes
self.motif+' - '+self.somme.to_s
end

def self.affichetransactions
left_joins(:depense).left_joins(:repas).where(["(Repas.id is  not null or Depense.id is not null)"])+Transac.jiramaetcotisation

end
def self.jiramaetcotisation
where(['motif in (?,?,?)','eau',"électricité",'cotisation'])
end
def username
user ? user.name : ""
end

def adddate
if ['eau',"électricité",'cotisation'].include?(self.motif)
self.somme = -(self.somme.abs)
end
self.date=DateTime.now
end
end
