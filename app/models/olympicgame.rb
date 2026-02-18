class Olympicgame < ApplicationRecord
has_many :editions
def seasonname
I18n.t('my.season.'+season)
end
def name
[seasonname.to_s, year.to_s].join(' ')
end
def self.seasons
all.select('season').distinct.group('season').map{|y|[y.seasonname,y.season]}
end

end
