class Musicalinstrumentshaveplayer < ApplicationRecord
belongs_to :musicalinstrument
belongs_to :person
validates_uniqueness_of :musicalinstrument_id, :scope => :person_id
def self.nbpages
(all.length / 10).to_i
end
def self.bypage(i)
all.limit(10).offset(i.to_i)
end

end
