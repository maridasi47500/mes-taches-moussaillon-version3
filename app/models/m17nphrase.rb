class M17nphrase < Phrase
has_many :m17nphraseshavepeople
has_many :people, through: :m17nphraseshavepeople

end
