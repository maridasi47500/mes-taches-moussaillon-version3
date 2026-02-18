class Round < ApplicationRecord
belongs_to :editionshaveevent
belongs_to :roundtype
    has_many :olympicresults
def dists
olympicdistances.distinct
end
#
def self.roundsid(f)
joins(:editionshaveevent).group('rounds.id').references(:editionshaveevent).where("editionshaveevents.id" => f)
end
has_one :olympicevent, through: :editionshaveevent, source: :olympicevent
has_one :sport_group, through: :olympicevent, source: :sport_group
has_one :edition, through: :editionshaveevent, source: :edition
has_one :olympicgame, through: :edition, source: :olympicgame
def isarelay?
olympicevent.name.downcase.include?('relay')
end

has_many :rounds
has_many :roundtypes, through: :rounds
has_many :manyolympicresults, through: :rounds, source: :olympicresults
has_many :nocs, through: :manyolympicresults, source: :noc
has_many :athletes, through: :manyolympicresults, source: :athlete
has_many :olympicdistances, through: :manyolympicresults
has_many :olympicsplits, through: :manyolympicdistances, source: :olympicsplits
#

def olympicresultsrelay
        select('*').group_by{|y|[y.heat,y.pos, y.lane, y.noc]}.to_a.group_by{|y|y[0][0]}


#.joins('left join olympicresults p on p.pos = olympicresults.pos and p.round_id = olympicresults.round_id and p.lane = olympicresults.lane and p.noc_id = olympicresults.noc_id')
#.joins('left join olympicresults o on o.id <= olympicresults.id and o.round_id = olympicresults.round_id and o.pos = olympicresults.pos and o.lane = olympicresults.lane and o.noc_id = olympicresults.noc_id')
    end
    has_many :olympicsplits, through: :olympicresults
    has_many :olympicdistances, -> { where.not( olympicsplits: { time: nil } ).having(["countsplits > 0"]).joins(:olympicsplits).select("count(olympicsplits.id) as countsplits, olympicdistances.name as myname").group("myname") }, through: :olympicsplits
    def uniquedistances
            a.sort_by{|y|y.myname.gsub('m','').to_i}

    end
    def name
        roundtype.name
    end
end
