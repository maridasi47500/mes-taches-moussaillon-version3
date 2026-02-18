class Olympicmedal < ApplicationRecord
attr_accessor :sport_id, :sport_group_id,:edition_id, :competition_type_id
attr_accessor :season_id, :athlete_gender, :gender, :event_name_id, :sort, :number
belongs_to :olympicresult, autosave: true
has_one :country, through: :olympicresult, source: :noc
has_one :editionshaveevent, through: :olympicresult, source: :editionshaveevent
has_one :olympicevent, through: :editionshaveevent, source: :olympicevent
has_one :sport_group, through: :olympicevent, source: :sport_group
has_one :edition, through: :editionshaveevent, source: :edition
has_one :olympicgame, through: :edition, source: :olympicgame

has_one :athlete, through: :olympicresult, source: :athlete

validates_uniqueness_of :olympicresult_id
has_one :editionshaveevent, through: :olympicresult, source: :olympicresult
def colorname
case color
when "or"
"or"
when "ar"
"argent"
when "br"
"bronze"
else
""
end
end
def self.allcolors
[['Trier par couleur','cl'],['Trier par le nombre total de médailles','to'],['Trier par la valeur de la médaille','va'],['Trier seulement par or', 'or'],["Trier seulement par médaille d'argent", 'ar'],['Trier seulement pour médaille de bronze','br']]
end
end
