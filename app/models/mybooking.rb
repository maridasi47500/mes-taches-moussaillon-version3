class Mybooking < ApplicationRecord
belongs_to :city
belongs_to :alias
belongs_to :place
alias_attribute :from, :from_date
alias_attribute :to, :to_date
validates_presence_of :place_id, :from, :to
validates_uniqueness_of :city_id, scope: [:place_id, :alias_id, :from_date, :to_date]
def self.currentbookings(x)
j=Mybooking.where(id: x)
p j
j.where(['(from_date < ? and to_date > ?) or to_date = ? or from_date = ?']+Array.new(4,Date.today))
end

end
