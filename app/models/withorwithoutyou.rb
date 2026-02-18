class Withorwithoutyou < ApplicationRecord
has_many :withyous

has_many :withoutyous
has_many :withthem, through: :withyous, source: :person
has_many :withoutthem, through: :withoutyous, source: :person
def tasks
Task.joins(:sailorjobs).where.not(sailorjobs: {"person_id" => self.withoutthem_ids}).where(sailorjobs: {"person_id" => self.withthem_ids})
end
end
