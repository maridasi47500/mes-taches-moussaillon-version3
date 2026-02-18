class Cle < ApplicationRecord
belongs_to :person, optional: true
belongs_to :armygrade, optional: true
attr_accessor :myarmygrade
before_validation :mygrade
def mygrade
if myarmygrade
self.armygrade=Armygrade.where('lower(abbreviation) like ?','%'+myarmygrade.downcase.gsub(' ','%')+'%')[0]
end
end
end
