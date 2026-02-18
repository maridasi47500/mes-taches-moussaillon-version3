class Edition < ApplicationRecord
      belongs_to :olympicgame
has_many :editionshaveevents
def competition
begincomp.to_s+" "+closecomp.to_s
end
def self.allmy
select('*').group_by{|y|y.olympicgame.seasonname}.map{|h,j|[h,j.collect{|k|[k.olympicgame.year,k.id]}]}
end
end
