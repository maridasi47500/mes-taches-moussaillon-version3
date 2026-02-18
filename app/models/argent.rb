class Argent < ApplicationRecord
attr_accessor :madepense
self.table_name='Argent'
belongs_to :user
before_validation :gerermonargent
def username
user ? user.name : ""
end
def gerermonargent
somme=Transac.where(id: self.madepense).pluck(:somme).sum
dernierargent=user.argent.last
self.paye=dernierargent.paye+somme
self.apayer=dernierargent.apayer-somme
end
def moisvalue
I18n.t("date.month_names")[DateTime.now.localtime.to_date.month]
end
end
